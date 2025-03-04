part of 'home_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  error,
}

extension LoginStatusEx on HomeState {
  bool get isInitial => getAllSubjectsStatus == Status.initial;

  bool get isLoading => getAllSubjectsStatus == Status.loading;

  bool get isSuccess => getAllSubjectsStatus == Status.success;

  bool get isError => getAllSubjectsStatus == Status.error;
}

class HomeState extends Equatable {
  Status getAllSubjectsStatus;
  List<SubjectEntity>? subjects;

  Object? error;

  HomeState(
      {this.getAllSubjectsStatus = Status.initial, this.error, this.subjects});

  HomeState copyWith(
      {Status? state, Object? error, List<SubjectEntity>? subjects}) {
    return HomeState(
      getAllSubjectsStatus: state ?? getAllSubjectsStatus,
      error: error ?? this.error,
      subjects: subjects ?? this.subjects,
    );
  }

  @override
  List<Object?> get props => [getAllSubjectsStatus, error, subjects];
}
