class ExamEntity {
  String? id;
  String? title;
  num? duration;
  String? subject;
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
}
