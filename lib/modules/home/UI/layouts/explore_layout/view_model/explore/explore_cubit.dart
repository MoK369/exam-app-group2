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
        break;
      case SearchInSubjectList():
        _searchInSubjectList(intent.keyword);
        break;
    }
  }

  late List<SubjectEntity> _subjectsList;

  Future<void> _getAllSubjects() async {
    emit(
      state.copyWith(
        state: Status.loading,
      ),
    );
    var result = await getAllSubjectsUseCase.execute();
    switch (result) {
      case Success<List<SubjectEntity>?>():
        _subjectsList = result.data ?? [];
        emit(
          state.copyWith(
            state: Status.success,
            userSearchedSubjects: _subjectsList,
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

  void _searchInSubjectList(String keyWord) {
    if (state.isSuccess) {
      List<SubjectEntity> resultSubjectsList = [];
      if (keyWord.trim().isEmpty) {
        if (state.userSearchedSubjects != _subjectsList) {
          emit(state.copyWith(
              searchStatus: SearchStatus.idle,
              userSearchedSubjects: _subjectsList));
        }
      } else {
        resultSubjectsList = _subjectsList.where(
          (subject) {
            return subject.name
                    ?.toLowerCase()
                    .contains(keyWord.toLowerCase()) ??
                false;
          },
        ).toList();
        if (resultSubjectsList.isEmpty) {
          emit(state.copyWith(
              searchStatus: SearchStatus.withoutResult,
              userSearchedSubjects: resultSubjectsList));
        } else {
          emit(state.copyWith(
              searchStatus: SearchStatus.withResult,
              userSearchedSubjects: resultSubjectsList));
        }
      }
    }
  }
}

sealed class HomeViewIntent {}

class GetAllSubjectsIntent extends HomeViewIntent {}

class SearchInSubjectList extends HomeViewIntent {
  String keyword;

  SearchInSubjectList(this.keyword);
}
