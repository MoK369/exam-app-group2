import 'package:exam_app_group2/modules/home/domain/entities/answer_entity.dart';

class Answer {
  Answer({
    this.answer,
    this.key,
  });

  Answer.fromJson(dynamic json) {
    answer = json['answer'];
    key = json['key'];
  }

  String? answer;
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    map['key'] = key;
    return map;
  }

  AnswerEntity toEntity() => AnswerEntity(
        answer: answer,
      );
}
