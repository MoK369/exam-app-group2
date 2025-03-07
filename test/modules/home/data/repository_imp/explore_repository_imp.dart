import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/explore_data_source.dart';
import 'package:exam_app_group2/modules/home/data/models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:exam_app_group2/modules/home/data/repository_imp/explore_repository_imp.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
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
  GetAllExamsOnSubjectResponse getAllExamsOnSubjectResponse =
      GetAllExamsOnSubjectResponse();
  setUpAll(() {
    mockExploreDataSource = MockExploreDataSource();
    homeRepo = HomeRepositoryImp(homeDataSource: mockExploreDataSource);
  });
  group('explore repo', () {
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

      test('get all subjects error', () async {
        // arrange
        provideDummy<ApiResult<GetAllSubjectsResponse>>(
            Error<GetAllSubjectsResponse>(error: 'error'));
        when(mockExploreDataSource.getAllSubjects()).thenAnswer(
            (_) async => Error<GetAllSubjectsResponse>(error: 'error'));

        // act
        var result = await homeRepo.getAllSubjects();

        // assert
        expect(result, isA<Error<List<SubjectEntity>?>>());
        verify(mockExploreDataSource.getAllSubjects()).called(1);
      });
    });

    group('get all exams on subject', () {
      test('get all exams on subject success ', () async {
        // arrange
        provideDummy<ApiResult<GetAllExamsOnSubjectResponse>>(
            Success<GetAllExamsOnSubjectResponse>(
                data: getAllExamsOnSubjectResponse));
        when(mockExploreDataSource.getAllExamsOnSubject(any)).thenAnswer(
            (_) async => Success<GetAllExamsOnSubjectResponse>(
                data: getAllExamsOnSubjectResponse));

        // act
        var result = await homeRepo.getAllExamsOnSubject('');

        // assert
        expect(result, isA<Success<List<ExamEntity>?>>());
        verify(mockExploreDataSource.getAllExamsOnSubject(any)).called(1);
      });
      test('get all exams on subject error ', () async {
        provideDummy<ApiResult<GetAllExamsOnSubjectResponse>>(
            Error<GetAllExamsOnSubjectResponse>(error: 'error'));
        when(mockExploreDataSource.getAllExamsOnSubject(any)).thenAnswer(
            (_) async => Error<GetAllExamsOnSubjectResponse>(error: 'error'));

        var result = await homeRepo.getAllExamsOnSubject('');

        expect(result, isA<Error<List<ExamEntity>?>>());
        verify(mockExploreDataSource.getAllExamsOnSubject(any)).called(1);
      });
    });
  });
}
