import 'package:isar/isar.dart';

part 'exam_entity.g.dart';

@embedded
class ExamEntity {
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;

  ExamEntity({
    this.id,
    this.title,
    num? duration,
    this.subject,
    num? numberOfQuestions,
    this.active,
  }){
    this.duration = duration?.toInt();
    this.numberOfQuestions = numberOfQuestions?.toInt();
  }
}
