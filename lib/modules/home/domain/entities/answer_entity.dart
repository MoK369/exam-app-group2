import 'package:isar/isar.dart';

part 'answer_entity.g.dart';

@embedded
class AnswerEntity {
  String? answer;

  AnswerEntity({this.answer});

  AnswerEntity.fromJson(dynamic json) {
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    return map;
  }
}
