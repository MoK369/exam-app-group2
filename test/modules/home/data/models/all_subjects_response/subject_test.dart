import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/subject.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call toEntity with non null values it should return SubjectEntity',
      () {
    // arrange
    Subject subject = Subject(
      id: '1',
      name: 'name',
      icon: 'icon',
      createdAt: '1',
    );
    // act
    var result = subject.toEntity();
    //assert
    expect(result, isA<SubjectEntity>());
  });

  test(
      'when call toEntity with null values it should return nullable SubjectEntity',
      () {
    // arrange
    Subject subject = Subject();
    // act
    var result = subject.toEntity();
    //assert
    expect(result, isA<SubjectEntity?>());
  });
}
