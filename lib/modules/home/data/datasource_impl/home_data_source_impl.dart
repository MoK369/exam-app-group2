import 'package:exam_app_group2/modules/home/data/api_manager/home_api_manager.dart';
import 'package:exam_app_group2/modules/home/data/models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart';
import 'package:exam_app_group2/modules/home/data/models/all_questions_response/get_all_questions_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_excutor/api_excutor.dart';
import '../../../../core/api/api_result/api_result.dart';
import '../datasource_contract/home_data_source_contract.dart';
import '../models/all_subjects_response/get_all_subjects_response.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  final HomeApiManager apiManager;

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
}
