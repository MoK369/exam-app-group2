part of 'exam_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  error,
}

extension LoginStatusEx on ExamState {
  bool get isInitial => getAllExamsStatus == Status.initial;

  bool get isLoading => getAllExamsStatus == Status.loading;

  bool get isSuccess => getAllExamsStatus == Status.success;

  bool get isError => getAllExamsStatus == Status.error;
}

class ExamState extends Equatable {
  Status getAllExamsStatus;
  List<ExamEntity>? exams;
  Object? error;

  ExamState({this.getAllExamsStatus = Status.initial, this.exams, this.error});

  ExamState copyWith({
    Status? getAllExamsStatus,
    List<ExamEntity>? exams,
    Object? error,
  }) {
    return ExamState(
      getAllExamsStatus: getAllExamsStatus ?? this.getAllExamsStatus,
      exams: exams ?? this.exams,
      error: error ?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [getAllExamsStatus, exams];
}
