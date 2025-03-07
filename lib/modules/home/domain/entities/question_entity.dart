import 'package:isar/isar.dart';

part 'question_entity.g.dart';

@collection
class QuestionEntity {
  QuestionEntity({
    this.question,
    this.correct,
    this.answers,
    this.id,
    this.type,
  });

  Id entityId = Isar.autoIncrement;

  String? question;
  String? correct;
  List<Answer>? answers;
  String? id;
  String? type;

  void updateEntityWith(QuestionEntity newEntity) {
    question = newEntity.question;
    correct = newEntity.correct;
    answers = newEntity.answers;
    id = newEntity.id;
    type = newEntity.type;
  }
}

@embedded
class Answer {
  Answer({
    this.answer,
    this.key,
  });

  String? answer;
  String? key;
}
