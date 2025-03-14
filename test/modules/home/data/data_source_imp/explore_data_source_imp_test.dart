import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/api_manager/explore_api_manager.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/explore_data_source.dart';
import 'package:exam_app_group2/modules/home/data/data_source_imp/explore_data_source_imp.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'explore_data_source_imp_test.mocks.dart';

@GenerateMocks([ExploreApiManager])
void main() {
  late MockExploreApiManager mockExploreApiManager;
  late ExploreDataSource exploreDataSource;
  GetAllSubjectsResponse getAllSubjectsResponse = GetAllSubjectsResponse();
  setUpAll(() {
    mockExploreApiManager = MockExploreApiManager();
    exploreDataSource = HomeDataSourceImpl(apiManager: mockExploreApiManager);
  });
  group('home date source ', () {
    group('get all subjects', () {
      test('get all subjects success from data source', () async {
        // arrange

        when(mockExploreApiManager.getAllSubjects())
            .thenAnswer((_) async => getAllSubjectsResponse);
        // act
        var result = await exploreDataSource.getAllSubjects();
        // assert
        expect(result, isA<Success<GetAllSubjectsResponse>>());
      });

      test('get all subjects Error from data source', () async {
        // arrange

        when(mockExploreApiManager.getAllSubjects())
            .thenThrow((_) async => getAllSubjectsResponse);
        // act
        var result = await exploreDataSource.getAllSubjects();
        // assert
        expect(result, isA<Error<GetAllSubjectsResponse>>());
      });
    });
  });
}
