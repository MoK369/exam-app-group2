import 'package:exam_app_group2/modules/home/domain/entities/answer_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:isar/isar.dart';
part 'question_entity.g.dart';

@embedded
class QuestionEntity {
  List<AnswerEntity>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  SubjectEntity? subject;
  ExamEntity? exam;

  QuestionEntity({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
  });

  QuestionEntity.fromJson(dynamic json) {
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(AnswerEntity.fromJson(v));
      });
    }
    type = json['type'];
    id = json['_id'];
    question = json['question'];
    correct = json['correct'];
    subject = json['subject'] != null
        ? SubjectEntity.fromJson(json['subject'])
        : null;
    exam = json['exam'] != null ? ExamEntity.fromJson(json['exam']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['type'] = type;
    map['_id'] = id;
    map['question'] = question;
    map['correct'] = correct;
    map['subject'] = subject;
    map['exam'] = exam;
    return map;
  }
}
