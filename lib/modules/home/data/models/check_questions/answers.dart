import 'package:isar/isar.dart';

part 'answers.g.dart';

@embedded
class Answers {
  Answers({
    this.questionId,
    this.correct,
  });

  Answers.fromJson(dynamic json) {
    questionId = json['questionId'];
    correct = json['correct'];
  }

  String? questionId;
  String? correct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['correct'] = correct;
    return map;
  }

  @override
  String toString() {
    return "($questionId, $correct)";
  }
}
