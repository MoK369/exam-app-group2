part of 'exam_score_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  error,
}

extension LoginStatusEx on ExamScoreState {
  bool get isInitial => getCheckedAnswersStatus == Status.initial;

  bool get isLoading => getCheckedAnswersStatus == Status.loading;

  bool get isSuccess => getCheckedAnswersStatus == Status.success;

  bool get isError => getCheckedAnswersStatus == Status.error;
}

class ExamScoreState extends Equatable {
  Status getCheckedAnswersStatus;
  CheckQuestionsResponseEntity? checkQuestionsResponseEntity;
  Object? error;

  ExamScoreState({
    this.getCheckedAnswersStatus = Status.initial,
    this.checkQuestionsResponseEntity,
    this.error,
  });

  ExamScoreState copyWith({
    Status? getCheckedAnswersStatus,
    CheckQuestionsResponseEntity? checkQuestionsResponseEntity,
    Object? error,
  }) {
    return ExamScoreState(
      getCheckedAnswersStatus:
          getCheckedAnswersStatus ?? this.getCheckedAnswersStatus,
      checkQuestionsResponseEntity:
          checkQuestionsResponseEntity ?? this.checkQuestionsResponseEntity,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        getCheckedAnswersStatus,
        checkQuestionsResponseEntity,
      ];
}
