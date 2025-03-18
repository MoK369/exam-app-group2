import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/explore_data_source.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/questions_offline_data_source.dart';
import 'package:exam_app_group2/modules/home/data/models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart';
import 'package:exam_app_group2/modules/home/data/models/all_questions_response/get_all_questions_response.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/check_question_response.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/check_questions_request.dart';
import 'package:exam_app_group2/modules/home/data/repository_imp/explore_repository_imp.dart';
import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/check_questions_response_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'explore_repository_imp_test.mocks.dart';

@GenerateMocks(
    [ExploreDataSource, QuestionsOfflineDataSource, CheckQuestionsRequest])
void main() {
  late MockExploreDataSource mockExploreDataSource;
  late MockQuestionsOfflineDataSource mockQuestionsOfflineDataSource;
  late ExploreRepository homeRepo;
  late MockCheckQuestionsRequest mockCheckQuestionsRequest;
  GetAllSubjectsResponse getAllSubjectsResponse = GetAllSubjectsResponse();
  GetAllExamsOnSubjectResponse getAllExamsOnSubjectResponse =
      GetAllExamsOnSubjectResponse();
  setUpAll(() {
    mockExploreDataSource = MockExploreDataSource();
    mockQuestionsOfflineDataSource = MockQuestionsOfflineDataSource();
    mockCheckQuestionsRequest = MockCheckQuestionsRequest();
    homeRepo = HomeRepositoryImp(
      homeDataSource: mockExploreDataSource,
      questionsOfflineDataSource: mockQuestionsOfflineDataSource,
    );
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

    group('get all questions on subject ', () {
      test('get all questions on subject success ', () async {
        // arrange
        provideDummy<ApiResult<GetAllQuestionsResponse>>(
          Success<GetAllQuestionsResponse>(data: GetAllQuestionsResponse()),
        );
        when(mockExploreDataSource.getAllQuestions(any)).thenAnswer(
          (_) async => Success<GetAllQuestionsResponse>(
            data: GetAllQuestionsResponse(),
          ),
        );

        // act
        var result = await homeRepo.getAllQuestions('');

        // assert
        expect(result, isA<Success<List<QuestionEntity>?>>());
        verify(mockExploreDataSource.getAllQuestions(any)).called(1);
      });

      test('get all questions on subject error ', () async {
        // arrange
        provideDummy<ApiResult<GetAllQuestionsResponse>>(
          Error<GetAllQuestionsResponse>(error: 'error'),
        );
        when(mockExploreDataSource.getAllQuestions(any)).thenAnswer(
          (_) async => Error<GetAllQuestionsResponse>(error: 'error'),
        );

        // act
        var result = await homeRepo.getAllQuestions(''); // assert
        expect(result, isA<Error<List<QuestionEntity>?>>());
        verify(mockExploreDataSource.getAllQuestions(any)).called(1);
      });
    });

    group('check questions', () {
      test('check questions success ', () async {
        // arrange
        provideDummy<ApiResult<CheckQuestionResponse>>(
          Success<CheckQuestionResponse>(data: CheckQuestionResponse()),
        );
        when(mockExploreDataSource.checkQuestions(
          checkQuestionRequest: mockCheckQuestionsRequest,
        )).thenAnswer(
          (_) async => Success<CheckQuestionResponse>(
            data: CheckQuestionResponse(),
          ),
        );

        // act
        var result = await homeRepo.checkQuestions(
            checkQuestionRequest: mockCheckQuestionsRequest);

        // assert
        expect(result, isA<Success<CheckQuestionsResponseEntity>>());
        verify(mockExploreDataSource.checkQuestions(
          checkQuestionRequest: mockCheckQuestionsRequest,
        )).called(1);
      });

      test('check questions error ', () async {
        // arrange
        provideDummy<ApiResult<CheckQuestionResponse>>(
          Error<CheckQuestionResponse>(error: 'error'),
        );
        when(mockExploreDataSource.checkQuestions(
          checkQuestionRequest: mockCheckQuestionsRequest,
        )).thenAnswer(
          (_) async => Error<CheckQuestionResponse>(error: 'error'),
        );
        // act
        var result = await homeRepo.checkQuestions(
            checkQuestionRequest: mockCheckQuestionsRequest);
        // assert
        expect(result, isA<Error<CheckQuestionsResponseEntity>>());
        verify(mockExploreDataSource.checkQuestions(
          checkQuestionRequest: mockCheckQuestionsRequest,
        )).called(1);
      });
    });

    group('get cashed question from data base', () {
      test('get cashed question from data base success ', () async {
        // arrange
        when(mockQuestionsOfflineDataSource.getCashedQuestionsAndAnswers())
            .thenAnswer(
          (_) async => [
            CashedQuestions(
              questions: [],
              answers: [],
            )
          ],
        );
        // act
        var result = await homeRepo.getCashedQuestionsAndAnswers();
        // assert
        expect(result, isA<List<CashedQuestions>?>());
        verify(mockQuestionsOfflineDataSource.getCashedQuestionsAndAnswers())
            .called(1);
      });

      test('get nullable cashed question from data base ', () async {
        // arrange
        when(mockQuestionsOfflineDataSource.getCashedQuestionsAndAnswers())
            .thenAnswer((_) async => null);
        // act
        var result = await homeRepo.getCashedQuestionsAndAnswers();
        // assert
        expect(result, isA<List<CashedQuestions>?>());
        verify(mockQuestionsOfflineDataSource.getCashedQuestionsAndAnswers());
      });
    });
  });
}
