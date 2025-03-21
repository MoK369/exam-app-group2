import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_all_subjects_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<HomeState> {
  ExploreCubit({required this.getAllSubjectsUseCase}) : super(HomeState());
  GetAllSubjectsUseCase getAllSubjectsUseCase;

  void doIntent(HomeViewIntent intent) {
    switch (intent) {
      case GetAllSubjectsIntent():
        _getAllSubjects();
    }
  }

  Future<void> _getAllSubjects() async {
    emit(
      state.copyWith(
        state: Status.loading,
      ),
    );
    var result = await getAllSubjectsUseCase.execute();
    switch (result) {
      case Success<List<SubjectEntity>?>():
        emit(
          state.copyWith(
            state: Status.success,
            subjects: result.data,
          ),
        );
      case Error<List<SubjectEntity>?>():
        emit(
          state.copyWith(
            state: Status.error,
            error: result.error,
          ),
        );
    }
  }
}

sealed class HomeViewIntent {}

class GetAllSubjectsIntent extends HomeViewIntent {}
