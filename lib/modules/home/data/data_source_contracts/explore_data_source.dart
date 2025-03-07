import 'package:exam_app_group2/modules/home/data/models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:exam_app_group2/modules/home/data/models/check_questions/check_question_response.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../models/all_questions_response/get_all_questions_response.dart';
import '../models/check_questions/check_questions_request.dart';

abstract interface class ExploreDataSource {
  Future<ApiResult<GetAllSubjectsResponse>> getAllSubjects();

  Future<ApiResult<GetAllExamsOnSubjectResponse>> getAllExamsOnSubject(
      String subjectId);

  Future<ApiResult<GetAllQuestionsResponse>> getAllQuestions(String examId);

  Future<ApiResult<CheckQuestionResponse>> checkQuestions({
    required CheckQuestionsRequest checkQuestionRequest,
  });
}
