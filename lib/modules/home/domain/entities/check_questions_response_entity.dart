class CheckQuestionsResponseEntity {
  String? message;
  num? correct;
  num? wrong;
  String? total;

  CheckQuestionsResponseEntity({
    this.message,
    this.correct,
    this.wrong,
    this.total,
  });
}
