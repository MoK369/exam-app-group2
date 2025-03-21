part of 'explore_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  error,
}

enum SearchStatus { idle, withResult, withoutResult }

extension LoginStatusEx on HomeState {
  bool get isInitial => getAllSubjectsStatus == Status.initial;

  bool get isLoading => getAllSubjectsStatus == Status.loading;

  bool get isSuccess => getAllSubjectsStatus == Status.success;

  bool get isError => getAllSubjectsStatus == Status.error;
}

class HomeState extends Equatable {
  Status getAllSubjectsStatus;
  List<SubjectEntity>? userSearchedSubjects;
  SearchStatus searchStatus;

  Object? error;

  HomeState({this.getAllSubjectsStatus = Status.initial,
    this.error,
    this.searchStatus = SearchStatus.idle,
    this.userSearchedSubjects});

  HomeState copyWith({Status? state,
    Object? error,
    SearchStatus? searchStatus,
    List<SubjectEntity>? userSearchedSubjects}) {
    return HomeState(
      getAllSubjectsStatus: state ?? getAllSubjectsStatus,
      error: error ?? this.error,
      searchStatus: searchStatus ?? this.searchStatus,
      userSearchedSubjects: userSearchedSubjects ?? this.userSearchedSubjects,
    );
  }

  @override
  List<Object?> get props =>
      [getAllSubjectsStatus, error, searchStatus, userSearchedSubjects];
}
