import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/home/data/models/all_exams_on_subject_response/get_all_exams_on_subject_response.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/apis_endpoints/apis_endpoints.dart';
import '../models/all_questions_response/get_all_questions_response.dart';

@singleton
class HomeApiManager {
  late final Dio _dio;

  HomeApiManager() {
    _dio = getIt.get<Dio>();
  }

  Future<GetAllSubjectsResponse> getAllSubjects() async {
    Response response = await _dio.get(ApisEndpoints.getAllSubjects);
    return GetAllSubjectsResponse.fromJson(response.data);
  }

  Future<GetAllExamsOnSubjectResponse> getAllExamsOnSubject({
    required String subjectId,
  }) async {
    Response response = await _dio.get(
      ApisEndpoints.getAllExamsOnSubject,
      queryParameters: {
        'subject': subjectId,
      },
    );

    return GetAllExamsOnSubjectResponse.fromJson(response.data);
  }

  Future<GetAllQuestionsResponse> getAllQuestions(
      {required String examId}) async {
    Response response = await _dio.get(
      ApisEndpoints.getAllQuestions,
    );

    return GetAllQuestionsResponse.fromJson(response.data);
  }
}
