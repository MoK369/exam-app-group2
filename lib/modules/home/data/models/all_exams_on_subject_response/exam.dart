import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';

class Exam {
  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  Exam.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }

  String? id;
  String? title;
  num? duration;
  String? subject;
  num? numberOfQuestions;
  bool? active;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['duration'] = duration;
    map['subject'] = subject;
    map['numberOfQuestions'] = numberOfQuestions;
    map['active'] = active;
    map['createdAt'] = createdAt;
    return map;
  }

  ExamEntity toEntity() => ExamEntity(
        title: title,
        id: id,
        active: active,
        duration: duration,
        numberOfQuestions: numberOfQuestions,
        subject: subject,
      );
}
