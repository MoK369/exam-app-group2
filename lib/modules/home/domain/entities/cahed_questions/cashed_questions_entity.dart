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

  // List<String>
  Id id = Isar.autoIncrement;

  CashedQuestions({
    this.questions,
    this.answers,
    this.subjectName,
  });

  CashedQuestions.fromJson(dynamic json) {
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(QuestionEntity.fromJson(v));
      });
    }
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
    json['examId'] = subjectName;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }

    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['examId'] = subjectName;

    return map;
  }

  void updateEntityWith(CashedQuestions cashedQuestions) {
    questions = cashedQuestions.questions;
    answers = cashedQuestions.answers;
    subjectName = cashedQuestions.subjectName;
  }
}
