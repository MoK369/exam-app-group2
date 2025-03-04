import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_all_questions.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/api/api_result/api_result.dart';

part 'questions_state.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit({required this.getAllQuestionsUseCase})
      : super(QuestionsState());
  GetAllQuestionsUseCase getAllQuestionsUseCase;

  void doIntent(QuestionsIntent intent) {
    switch (intent) {
      case GetAllQuestionsIntent():
        _getAllQuestions(examId: intent.examId);
      case NextQuestionIntent():
        _nextQuestion();
      case PreviousQuestionIntent():
        _previousQuestion();
    }
  }

  int correctAnswers = 0;
  int wrongAnswers = 0;

  void getExamResult(Map<int, int> correctAnswersMap) {
    for (var key in userAnswers.keys) {
      if (correctAnswersMap.containsKey(key)) {
        if (userAnswers[key] == correctAnswersMap[key]) {
          correctAnswers++;
        } else {
          wrongAnswers++;
        }
      }
    }
  }

  int currentQuestion = 1;
  Map<int, int> userAnswers = {};

  Future<void> _getAllQuestions({required String examId}) async {
    emit(state.copyWith(getAllQuestionsStatus: Status.loading));
    var result = await getAllQuestionsUseCase.execute(examId: examId);
    switch (result) {
      case Success<List<QuestionEntity>>():
        emit(
          state.copyWith(
            getAllQuestionsStatus: Status.success,
            questions: result.data,
          ),
        );
      case Error<List<QuestionEntity>>():
        emit(
          state.copyWith(
            getAllQuestionsStatus: Status.error,
            error: result.error,
          ),
        );
    }
  }

  void _nextQuestion() {
    if (_isLastQuestion()) return;
    currentQuestion++;

    emit(state.copyWith(
      questionsStatus: QuestionsStatus.nextQuestion,
      currentQuestion: currentQuestion,
    ));
  }

  void _previousQuestion() {
    if (currentQuestion > 1) currentQuestion--;
    emit(state.copyWith(
      questionsStatus: QuestionsStatus.previousQuestion,
      currentQuestion: currentQuestion,
    ));
  }

  bool _isLastQuestion() {
    bool isLastQuestion = currentQuestion == state.questions!.length;
    if (isLastQuestion) {
      emit(state.copyWith(questionsStatus: QuestionsStatus.endExam));
    }
    return isLastQuestion;
  }

  bool get isEndExam => state.isEndExam;
}

sealed class QuestionsIntent {}

class GetAllQuestionsIntent extends QuestionsIntent {
  String examId;

  GetAllQuestionsIntent({required this.examId});
}

class NextQuestionIntent extends QuestionsIntent {}

class PreviousQuestionIntent extends QuestionsIntent {}
