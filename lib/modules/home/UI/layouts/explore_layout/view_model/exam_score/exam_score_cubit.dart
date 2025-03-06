import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/answers.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/api/api_result/api_result.dart';
import '../../../../../data/models/check_questions/check_questions_request.dart';
import '../../../../../domain/entities/check_questions_response_entity.dart';
import '../../../../../domain/use_cases/check_questions.dart';

part 'exam_score_state.dart';

@injectable
class ExamScoreCubit extends Cubit<ExamScoreState> {
  ExamScoreCubit({required this.checkQuestionsUseCase})
      : super(ExamScoreState());
  CheckQuestionsUseCase checkQuestionsUseCase;

  void doIntent(ExamScoreIntent intent) {
    switch (intent) {
      case GetCheckedAnswers():
        _checkQuestions(
          checkedAnswers: intent.answers,
        );
    }
  }

  Future<void> _checkQuestions({required List<Answers>? checkedAnswers}) async {
    emit(state.copyWith(getCheckedAnswersStatus: Status.loading));
    var result = await checkQuestionsUseCase.execute(
      checkQuestionRequest: CheckQuestionsRequest(
        answers: checkedAnswers,
      ),
    );
    switch (result) {
      case Success<CheckQuestionsResponseEntity>():
        emit(
          state.copyWith(
            getCheckedAnswersStatus: Status.success,
            checkQuestionsResponseEntity: result.data,
          ),
        );
      case Error<CheckQuestionsResponseEntity>():
        emit(
          state.copyWith(
            getCheckedAnswersStatus: Status.error,
            error: result.error,
          ),
        );
    }
  }
}

sealed class ExamScoreIntent {}

class GetCheckedAnswers extends ExamScoreIntent {
  List<Answers>? answers;

  GetCheckedAnswers({required this.answers});
}
