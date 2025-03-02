import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/datasource_contract/home_data_source_contract.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:exam_app_group2/modules/home/data/repo_impl/home_repo_impl.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repo_contract/home_repo_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeDataSource])
void main() {
  late MockHomeDataSource mockHomeDataSource;
  late HomeRepo homeRepo;
  GetAllSubjectsResponse getAllSubjectsResponse = GetAllSubjectsResponse();
  setUpAll(() {
    mockHomeDataSource = MockHomeDataSource();
    homeRepo = HomeRepoImpl(homeDataSource: mockHomeDataSource);
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
