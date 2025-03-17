import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_cashed_question.dart';
import 'package:injectable/injectable.dart';

@injectable
class CachedQuestionsCubit extends Cubit<CachedQuestionsState> {
  final GetCashedQuestionUseCase getCashedQuestionUseCase;

  CachedQuestionsCubit({required this.getCashedQuestionUseCase})
      : super(CachedQuestionsState());

  void doIntent(CachedQuestionsIntent intent) {
    switch (intent) {
      case GetCachedQuestionsIntent():
        _fetchCachedQuestions();
    }
  }

  Future<void> _fetchCachedQuestions() async {
    emit(state.copyWith(status: Status.loading));

    try {
      final result = await getCashedQuestionUseCase.execute();
      emit(state.copyWith(
        status: Status.success,
        cachedQuestions: result,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: Status.error,
        error: error,
      ));
    }
  }
}

sealed class CachedQuestionsIntent {}

class GetCachedQuestionsIntent extends CachedQuestionsIntent {}

enum Status {
  initial,
  loading,
  success,
  error,
}

extension CachedQuestionsStatusEx on CachedQuestionsState {
  bool get isInitial => status == Status.initial;
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isError => status == Status.error;
}

class CachedQuestionsState extends Equatable {
  final Status status;
  final List<CashedQuestions>? cachedQuestions;
  final Object? error;

  CachedQuestionsState({
    this.status = Status.initial,
    this.cachedQuestions,
    this.error,
  });

  CachedQuestionsState copyWith({
    Status? status,
    List<CashedQuestions>? cachedQuestions,
    Object? error,
  }) {
    return CachedQuestionsState(
      status: status ?? this.status,
      cachedQuestions: cachedQuestions ?? this.cachedQuestions,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, cachedQuestions, error];
}
