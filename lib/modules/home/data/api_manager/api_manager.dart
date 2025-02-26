import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/apis_endpoints/apis_endpoints.dart';

@singleton
class ApiManager {
  late final Dio _dio;

  ApiManager() {
    _dio = getIt.get<Dio>();
  }

  Future<GetAllSubjectsResponse> getAllSubjects() async {
    Response response = await _dio.get(ApisEndpoints.getAllSubjects);
    return GetAllSubjectsResponse.fromJson(response.data);
  }
}
