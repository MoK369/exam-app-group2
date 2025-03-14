import 'package:isar/isar.dart';

part 'exam_entity.g.dart';

@embedded
class ExamEntity {
  String? id;
  String? title;
  @ignore
  num? duration;
  String? subject;
  @ignore
  num? numberOfQuestions;
  bool? active;

  ExamEntity({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
  });

  ExamEntity.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
  }
}
