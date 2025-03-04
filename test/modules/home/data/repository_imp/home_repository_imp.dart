import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/home_data_source.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:exam_app_group2/modules/home/data/repository_imp/home_repository_imp.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/home_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_imp.mocks.dart';

@GenerateMocks([HomeDataSource])
void main() {
  late MockHomeDataSource mockHomeDataSource;
  late HomeRepository homeRepo;
  GetAllSubjectsResponse getAllSubjectsResponse = GetAllSubjectsResponse();
  setUpAll(() {
    mockHomeDataSource = MockHomeDataSource();
    homeRepo = HomeRepositoryImp(homeDataSource: mockHomeDataSource);
  });
  group('home repo', () {
    group('get all subjects', () {
      test('get all subjects success', () async {
        // arrange
        provideDummy<ApiResult<GetAllSubjectsResponse>>(
            Success<GetAllSubjectsResponse>(data: getAllSubjectsResponse));
        when(mockHomeDataSource.getAllSubjects()).thenAnswer((_) async =>
            Success<GetAllSubjectsResponse>(data: getAllSubjectsResponse));

        // act
        var result = await homeRepo.getAllSubjects();

        // assert
        expect(result, isA<Success<List<SubjectEntity>?>>());
        verify(mockHomeDataSource.getAllSubjects()).called(1);
      });
    });
  });
}
