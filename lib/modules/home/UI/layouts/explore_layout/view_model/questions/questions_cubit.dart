import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/check_questions_response_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/check_questions.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_all_questions.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_cashed_question.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/save_questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/api/api_result/api_result.dart';
import '../../../../../data/models/check_questions/answers.dart';
import '../../../../../data/models/check_questions/check_questions_request.dart';

part 'questions_state.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit({
    required this.getAllQuestionsUseCase,
    required this.checkQuestionsUseCase,
    required this.saveQuestionsUseCase,
    required this.getCashedQuestionUseCase,
  }) : super(QuestionsState());
  GetAllQuestionsUseCase getAllQuestionsUseCase;
  CheckQuestionsUseCase checkQuestionsUseCase;
  SaveQuestionsUseCase saveQuestionsUseCase;
  GetCashedQuestionUseCase getCashedQuestionUseCase;

  T? doIntent<T>(QuestionsIntent intent) {
    switch (intent) {
      case GetAllQuestionsIntent():
        _getAllQuestions(examId: intent.examId);
      case NextQuestionIntent():
        _nextQuestion();
      case PreviousQuestionIntent():
        _previousQuestion();
      case CheckQuestionIntent():
        _checkQuestions();
      case GetAnswersList():
        _getCheckedAnswers();
      case GetCashedQuestionIntent():
        _getCashedQuestionsAndAnswers();
      case SaveCashedQuestionIntent():
        _cashQuestionsAndAnswers();
      case StartTimer():
        _startTimer(intent.numberOfMinutes);
        break;
      case GetMinutesSecondsTimeFormat():
        return _getMinutesSecondsTimeFormat(intent.numberOfSeconds) as T;
    }
    return null;
  }

  int currentQuestion = 1;
  int selectedAnswerIndex = 0;

  List<Answers> checkedAnswers = [];
  List<QuestionEntity>? questions = [];

  Map<String?, String> answersMap = {};

  ValueNotifier<int> examTimeValueNotifier = ValueNotifier<int>(-1);
  int secondsCounter = 0;
  Timer? _examTimer;

  void _getCheckedAnswers() {
    answersMap.forEach((key, value) {
      checkedAnswers.add(Answers(
        questionId: key?.split("_")[0],
        correct: value,
      ));
    });
  }

  Future<void> _cashQuestionsAndAnswers() async {
    await saveQuestionsUseCase.execute(CashedQuestions(
      questions: questions,
      answers: checkedAnswers,
      examEntity: questions![0].exam,
      subjectName: questions![0].subject?.name,
    ));
  }

  Future<List<CashedQuestions>?> _getCashedQuestionsAndAnswers() {
    return getCashedQuestionUseCase.execute();
  }

  Future<void> _getAllQuestions({required String examId}) async {
    emit(state.copyWith(getAllQuestionsStatus: Status.loading));
    var result = await getAllQuestionsUseCase.execute(examId: examId);
    switch (result) {
      case Success<List<QuestionEntity>?>():
        questions = result.data;
        emit(
          state.copyWith(
            getAllQuestionsStatus: Status.success,
            questions: result.data,
          ),
        );
      case Error<List<QuestionEntity>?>():
        emit(
          state.copyWith(
            getAllQuestionsStatus: Status.error,
            error: result.error,
          ),
        );
    }
  }

  void _startTimer(int durationInMeniutes) {

    if (_examTimer?.isActive ?? false) {
      return;
    }
    examTimeValueNotifier.value = durationInMeniutes * 60;
    _examTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (examTimeValueNotifier.value >= 1) {
          examTimeValueNotifier.value -= 1;
        } else {
          _examTimer?.cancel();
        }
      },
    );
  }

  String _getMinutesSecondsTimeFormat(int seconds) {
    if (seconds >= 0) {
      int minutes = seconds ~/ 60;
      seconds = seconds % 60;
      return "${minutes > 9 ? minutes : "0$minutes"}:${seconds > 9 ? seconds : "0$seconds"}";
    }
    return "00:00";
  }

  Future<void> _checkQuestions() async {
    emit(state.copyWith(checkQuestionsStatus: Status.loading));
    var result = await checkQuestionsUseCase.execute(
      checkQuestionRequest: CheckQuestionsRequest(
        answers: checkedAnswers,
      ),
    );

    switch (result) {
      case Success<CheckQuestionsResponseEntity>():
        emit(
          state.copyWith(
            checkQuestionsStatus: Status.success,
            checkQuestionsResponseEntity: result.data,
          ),
        );
      case Error<CheckQuestionsResponseEntity>():
        emit(
          state.copyWith(
            checkQuestionsStatus: Status.error,
            error: result.error,
          ),
        );
    }
  }

  void _nextQuestion() {
    if (_isLastQuestion()) return;
    var questionFound = false;
    currentQuestion++;
    answersMap.forEach(
      (key, value) {
        if (int.parse(key?.split("_")[1] ?? "") == currentQuestion) {
          selectedAnswerIndex = int.parse(value.substring(1)) - 1;
          questionFound = true;
        }
      },
    );
    if (!questionFound) {
      selectedAnswerIndex = 0;
    }
    emit(state.copyWith(
      questionsStatus: QuestionsStatus.nextQuestion,
      currentQuestion: currentQuestion,
    ));
  }

  void _previousQuestion() {
    if (currentQuestion > 1) currentQuestion--;
    answersMap.forEach(
      (key, value) {
        if (int.parse(key?.split("_")[1] ?? "") == currentQuestion) {
          selectedAnswerIndex = int.parse(value.substring(1)) - 1;
        }
      },
    );
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

class CheckQuestionIntent extends QuestionsIntent {}

class GetAnswersList extends QuestionsIntent {}

class GetCashedQuestionIntent extends QuestionsIntent {}

class SaveCashedQuestionIntent extends QuestionsIntent {}

class StartTimer extends QuestionsIntent {
  int numberOfMinutes;

  StartTimer(this.numberOfMinutes);
}

class GetMinutesSecondsTimeFormat extends QuestionsIntent {
  int numberOfSeconds;
  GetMinutesSecondsTimeFormat(this.numberOfSeconds);
}
