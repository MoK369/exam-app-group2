import 'package:exam_app_group2/modules/home/data/models/check_questions/check_question_response.dart';
import 'package:exam_app_group2/modules/home/domain/entities/check_questions_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'when call toEntity with non null values it should return checkQuestionResponseEntity',
      () {
    // arrange
    CheckQuestionResponse checkQuestionResponse = CheckQuestionResponse(
      correct: 2,
      wrong: 3,
      total: 'total',
    );
    // act
    var result = checkQuestionResponse.toEntity();
    //assert
    expect(result, isA<CheckQuestionsResponseEntity>());
  });

  test(
      'when call toEntity with null values it should return nullable checkQuestionResponseEntity',
      () {
    // arrange
    CheckQuestionResponse checkQuestionResponse = CheckQuestionResponse();
    // act
    var result = checkQuestionResponse.toEntity();
    //assert
    expect(result, isA<CheckQuestionsResponseEntity?>());
  });
}
