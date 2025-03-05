import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/explore_data_source.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:exam_app_group2/modules/home/data/repository_imp/explore_repository_imp.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'explore_repository_imp.mocks.dart';

@GenerateMocks([ExploreDataSource])
void main() {
  late MockExploreDataSource mockExploreDataSource;
  late ExploreRepository homeRepo;
  GetAllSubjectsResponse getAllSubjectsResponse = GetAllSubjectsResponse();
  setUpAll(() {
    mockExploreDataSource = MockExploreDataSource();
    homeRepo = HomeRepositoryImp(homeDataSource: mockExploreDataSource);
  });
  group('home repo', () {
    group('get all subjects', () {
      test('get all subjects success', () async {
        // arrange
        provideDummy<ApiResult<GetAllSubjectsResponse>>(
            Success<GetAllSubjectsResponse>(data: getAllSubjectsResponse));
        when(mockExploreDataSource.getAllSubjects()).thenAnswer((_) async =>
            Success<GetAllSubjectsResponse>(data: getAllSubjectsResponse));

        // act
        var result = await homeRepo.getAllSubjects();

        // assert
        expect(result, isA<Success<List<SubjectEntity>?>>());
        verify(mockExploreDataSource.getAllSubjects()).called(1);
      });
    });
  });
}
