import 'package:isar/isar.dart';

part 'check_question_entity.g.dart';

@collection
class CheckQuestionEntity {
  CheckQuestionEntity({
    this.examId,
    this.total,
    this.correct,
    this.wrongQuestions,
    this.message,
    this.correctQuestions,
    this.wrong,
  });

  Id id = Isar.autoIncrement;
  String? examId;

  String? total;
  int? correct;
  List<Question>? wrongQuestions;
  String? message;
  List<Question>? correctQuestions;
  int? wrong;
}

@embedded
class Question {
  Question({
    //this.answers,
    this.question,
    this.correctAnswer,
    this.qid,
    this.inCorrectAnswer,
  });

  //Answers? answers;
  String? question;
  String? correctAnswer;
  String? qid;
  String? inCorrectAnswer;
}

// class Answers {
//   Answers();
// }
