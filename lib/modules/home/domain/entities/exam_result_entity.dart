import 'package:isar/isar.dart';

part 'exam_result_entity.g.dart';

@collection
class ExamResultEntity {
  ExamResultEntity({
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
  String? subjectId;
  String? total;
  int? correct;
  List<CheckedQuestion>? wrongQuestions;
  String? message;
  List<CheckedQuestion>? correctQuestions;
  int? wrong;

  void updateEntityWith(ExamResultEntity newEntity) {
    total = newEntity.total;
    correct = newEntity.correct;
    wrongQuestions = newEntity.wrongQuestions;
    message = newEntity.message;
    correctQuestions = newEntity.correctQuestions;
    wrong = newEntity.wrong;
  }
}

@embedded
class CheckedQuestion {
  CheckedQuestion({
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
