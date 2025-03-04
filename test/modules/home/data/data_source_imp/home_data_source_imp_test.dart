import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/api_manager/home_api_manager.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/home_data_source.dart';
import 'package:exam_app_group2/modules/home/data/data_source_imp/home_data_source_imp.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_data_source_imp_test.mocks.dart';

@GenerateMocks([HomeApiManager])
void main() {
  late MockHomeApiManager mockHomeApiManager;
  late HomeDataSource homeDataSource;
  GetAllSubjectsResponse getAllSubjectsResponse = GetAllSubjectsResponse();
  setUpAll(() {
    mockHomeApiManager = MockHomeApiManager();
    homeDataSource = HomeDataSourceImpl(apiManager: mockHomeApiManager);
  });
  group('home date source ', () {
    group('get all subjects', () {
      test('get all subjects success from data source', () async {
        // arrange

        when(mockHomeApiManager.getAllSubjects())
            .thenAnswer((_) async => getAllSubjectsResponse);
        // act
        var result = await homeDataSource.getAllSubjects();
        // assert
        expect(result, isA<Success<GetAllSubjectsResponse>>());
      });

      test('get all subjects Error from data source', () async {
        // arrange

        when(mockHomeApiManager.getAllSubjects())
            .thenThrow((_) async => getAllSubjectsResponse);
        // act
        var result = await homeDataSource.getAllSubjects();
        // assert
        expect(result, isA<Error<GetAllSubjectsResponse>>());
      });
    });
  });
}
