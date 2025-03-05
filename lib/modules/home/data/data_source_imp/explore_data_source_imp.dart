import 'package:exam_app_group2/modules/home/data/api_manager/explore_api_manager.dart';
import 'package:exam_app_group2/modules/home/data/models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart';
import 'package:exam_app_group2/modules/home/data/models/all_questions_response/get_all_questions_response.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/check_question_response.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/check_questions_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_excutor/api_excutor.dart';
import '../../../../core/api/api_result/api_result.dart';
import '../data_source_contracts/explore_data_source.dart';
import '../models/all_subjects_response/get_all_subjects_response.dart';

@Injectable(as: ExploreDataSource)
class HomeDataSourceImpl implements ExploreDataSource {
  final ExploreApiManager apiManager;

  HomeDataSourceImpl({required this.apiManager});

  @override
  Future<ApiResult<GetAllSubjectsResponse>> getAllSubjects() async {
    return await ApiExecutor.executeApi<GetAllSubjectsResponse>(
      () => apiManager.getAllSubjects(),
    );
  }

  @override
  Future<ApiResult<GetAllExamsOnSubjectResponse>> getAllExamsOnSubject(
      String subjectId) async {
    return await ApiExecutor.executeApi<GetAllExamsOnSubjectResponse>(
      () => apiManager.getAllExamsOnSubject(subjectId: subjectId),
    );
  }

  @override
  Future<ApiResult<GetAllQuestionsResponse>> getAllQuestions(
      String examId) async {
    return await ApiExecutor.executeApi<GetAllQuestionsResponse>(
      () => apiManager.getAllQuestions(examId: examId),
    );
  }

  @override
  Future<ApiResult<CheckQuestionResponse>> checkQuestions(
      {required CheckQuestionsRequest checkQuestionRequest}) async {
    return await ApiExecutor.executeApi<CheckQuestionResponse>(
      () =>
          apiManager.checkQuestions(checkQuestionRequest: checkQuestionRequest),
    );
  }
}
