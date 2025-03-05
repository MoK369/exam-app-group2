class Questions {
  Questions(
      {this.qid,
      this.question,
      this.correctAnswer,
      this.answers,
      this.inCorrectAnswer});

  Questions.fromJson(dynamic json) {
    qid = json['QID'];
    question = json['Question'];
    correctAnswer = json['correctAnswer'];
    inCorrectAnswer = json['inCorrectAnswer'];
    answers = json['answers'];
  }

  String? qid;
  String? question;
  String? correctAnswer;
  String? inCorrectAnswer;
  dynamic answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['QID'] = qid;
    map['Question'] = question;
    map['correctAnswer'] = correctAnswer;
    map['inCorrectAnswer'] = inCorrectAnswer;
    map['answers'] = answers;
    return map;
  }
}
