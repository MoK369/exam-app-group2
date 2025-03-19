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
}
