part of 'questions_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  error,
}

enum QuestionsStatus {
  nextQuestion,
  previousQuestion,
  endExam,
}

extension LoginStatusEx on QuestionsState {
  bool get isInitial => getAllQuestionsStatus == Status.initial;

  bool get isLoading => getAllQuestionsStatus == Status.loading;

  bool get isSuccess => getAllQuestionsStatus == Status.success;

  bool get isError => getAllQuestionsStatus == Status.error;

  bool get isEndExam => questionsStatus == QuestionsStatus.endExam;
}

class QuestionsState extends Equatable {
  Status getAllQuestionsStatus;
  QuestionsStatus? questionsStatus;
  List<QuestionEntity>? questions;
  int? currentQuestion;
  Object? error;

  QuestionsState({
    this.getAllQuestionsStatus = Status.initial,
    this.questions,
    this.error,
    this.questionsStatus,
    this.currentQuestion = 1,
  });

  QuestionsState copyWith({
    Status? getAllQuestionsStatus,
    List<QuestionEntity>? questions,
    Object? error,
    QuestionsStatus? questionsStatus,
    int? currentQuestion,
  }) {
    return QuestionsState(
        getAllQuestionsStatus:
            getAllQuestionsStatus ?? this.getAllQuestionsStatus,
        questions: questions ?? this.questions,
        error: error ?? this.error,
        questionsStatus: questionsStatus ?? this.questionsStatus,
        currentQuestion: currentQuestion ?? this.currentQuestion);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        getAllQuestionsStatus,
        questions,
        error,
        questionsStatus,
        currentQuestion
      ];
}
