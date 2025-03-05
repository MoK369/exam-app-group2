import 'package:exam_app_group2/modules/home/data/models/check_questions/check_question_response.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/check_questions_request.dart';
import 'package:exam_app_group2/modules/home/domain/entities/check_questions_response_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../../domain/entities/exam_entity.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/entities/subject_entity.dart';
import '../data_source_contracts/explore_data_source.dart';
import '../models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart';
import '../models/all_questions_response/get_all_questions_response.dart';
import '../models/all_subjects_response/get_all_subjects_response.dart';

@Injectable(as: ExploreRepository)
class HomeRepositoryImp implements ExploreRepository {
  ExploreDataSource homeDataSource;

  HomeRepositoryImp({required this.homeDataSource});

  @override
  Future<ApiResult<List<SubjectEntity>?>> getAllSubjects() async {
    var result = await homeDataSource.getAllSubjects();
    switch (result) {
      case Success<GetAllSubjectsResponse>():
        return Success(
          data: result.data.subjects
              ?.map((subject) => subject.toEntity())
              .toList(),
        );
      case Error<GetAllSubjectsResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<List<ExamEntity>?>> getAllExamsOnSubject(
      String subjectId) async {
    var result = await homeDataSource.getAllExamsOnSubject(subjectId);
    switch (result) {
      case Success<GetAllExamsOnSubjectResponse>():
        return Success(
          data: result.data.exams?.map((exam) => exam.toEntity()).toList(),
        );
      case Error<GetAllExamsOnSubjectResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<List<QuestionEntity>>> getAllQuestions(String examId) async {
    var result = await homeDataSource.getAllQuestions(examId);
    switch (result) {
      case Success<GetAllQuestionsResponse>():
        return Success(
          data: result.data.questions!
              .map((question) => question.toEntity())
              .toList(),
        );
      case Error<GetAllQuestionsResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<CheckQuestionsResponseEntity>> checkQuestions({
    required CheckQuestionsRequest checkQuestionRequest,
  }) async {
    var result = await homeDataSource.checkQuestions(
        checkQuestionRequest: checkQuestionRequest);
    switch (result) {
      case Success<CheckQuestionResponse>():
        return Success(
          data: result.data.toEntity(),
        );
      case Error<CheckQuestionResponse>():
        return Error(error: result.error);
    }
  }
}
