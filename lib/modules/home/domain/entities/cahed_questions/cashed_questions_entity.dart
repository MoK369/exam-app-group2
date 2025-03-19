import 'package:exam_app_group2/modules/home/domain/entities/answer_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:isar/isar.dart';

import '../../../data/models/check_questions/answers.dart';
import '../subject_entity.dart';

part 'cashed_questions_entity.g.dart';

@Collection()
class CashedQuestions {
  List<QuestionEntity>? questions;
  List<Answers>? answers;
  String? subjectName;
  ExamEntity? examEntity;

  // List<String>
  Id id = Isar.autoIncrement;

  CashedQuestions(
      {this.questions, this.answers, this.subjectName, this.examEntity});

  void updateEntityWith(CashedQuestions cashedQuestions) {
    questions = cashedQuestions.questions;
    answers = cashedQuestions.answers;
    examEntity = cashedQuestions.examEntity;
    subjectName = cashedQuestions.subjectName;
  }
}
