import 'answers.dart';

class CheckQuestionsRequest {
  CheckQuestionsRequest({
    this.answers,
    this.time,
  });

  CheckQuestionsRequest.fromJson(dynamic json) {
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
    time = json['time'];
  }

  List<Answers>? answers;
  num? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['time'] = time;
    return map;
  }
}
