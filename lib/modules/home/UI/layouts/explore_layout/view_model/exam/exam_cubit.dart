import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_all_exams_on_subject.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/api/api_result/api_result.dart';

part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  ExamCubit({
    required this.getAllExamsOnSubjectUseCase,
  }) : super(ExamState());
  GetAllExamsOnSubjectUseCase getAllExamsOnSubjectUseCase;

  void doIntent(ExamIntent intent) {
    switch (intent) {
      case GetAllExamsIntent():
        _getAllExams(intent.subjectId);
    }
  }

  Future<void> _getAllExams(String subjectId) async {
    emit(state.copyWith(getAllExamsStatus: Status.loading));
    var result = await getAllExamsOnSubjectUseCase.execute(subjectId);
    switch (result) {
      case Success<List<ExamEntity>?>():
        emit(state.copyWith(
          getAllExamsStatus: Status.success,
          exams: result.data,
        ));
      case Error<List<ExamEntity>?>():
        emit(state.copyWith(
          getAllExamsStatus: Status.error,
          error: result.error,
        ));
    }
  }
}

sealed class ExamIntent {}

class GetAllExamsIntent extends ExamIntent {
  String subjectId;

  GetAllExamsIntent({required this.subjectId});
}
