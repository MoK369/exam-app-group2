import 'package:exam_app_group2/modules/home/data/models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../models/all_questions_response/get_all_questions_response.dart';

abstract interface class HomeDataSource {
  Future<ApiResult<GetAllSubjectsResponse>> getAllSubjects();

  Future<ApiResult<GetAllExamsOnSubjectResponse>> getAllExamsOnSubject(
      String subjectId);

  Future<ApiResult<GetAllQuestionsResponse>> getAllQuestions(String examId);
}
