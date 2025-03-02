import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repo_contract/home_repo_contract.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_all_subjects_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_subjects_use_case_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  late GetAllSubjectsUseCase getAllSubjectsUseCase;
  late MockHomeRepo mockHomeRepo;
  setUpAll(() {
    mockHomeRepo = MockHomeRepo();
    getAllSubjectsUseCase = GetAllSubjectsUseCase(repo: mockHomeRepo);
  });

  group("get subjects use case ", () {
    test('get subjects success from use case ', () async {
      // arrange
      provideDummy<ApiResult<List<SubjectEntity>?>>(
          Success<List<SubjectEntity>?>(data: []));
      when(mockHomeRepo.getAllSubjects())
          .thenAnswer((_) async => Success<List<SubjectEntity>?>(data: []));

      // act
      var result = await getAllSubjectsUseCase.execute();

      // assert
      expect(result, isA<Success<List<SubjectEntity>?>>());
      verify(mockHomeRepo.getAllSubjects()).called(1);
    });

    test('get subjects Error from use case ', () async {
      // arrange
      provideDummy<ApiResult<List<SubjectEntity>?>>(
          Error<List<SubjectEntity>?>(error: Object()));
      when(mockHomeRepo.getAllSubjects()).thenAnswer(
          (_) async => Error<List<SubjectEntity>?>(error: Object()));

      // act
      var result = await getAllSubjectsUseCase.execute();

      // assert
      expect(result, isA<Error<List<SubjectEntity>?>>());
      verify(mockHomeRepo.getAllSubjects()).called(1);
    });
  });
}
