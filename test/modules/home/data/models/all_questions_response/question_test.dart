import 'package:exam_app_group2/modules/home/data/models/all_questions_response/answer.dart';
import 'package:exam_app_group2/modules/home/data/models/all_questions_response/question.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'when call toEntity with non null values it should return questionEntity',
      () {
    // arrange
    Question question = Question(
      id: '1',
      type: 'type',
      question: 'question',
      correct: 'correct',
      answers: [
        Answer(
          answer: 'answer',
        ),
      ],
    );
    // act
    var result = question.toEntity();
    //assert
    expect(result, isA<QuestionEntity>());
  });
  test(
      'when call toEntity with null values it should return nullable questionEntity',
      () {
    // arrange
    Question question = Question();
    // act
    var result = question.toEntity();
    //assert
    expect(result, isA<QuestionEntity?>());
  });
}
