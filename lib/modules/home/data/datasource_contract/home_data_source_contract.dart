import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';

import '../../../../core/api/api_result/api_result.dart';

abstract interface class HomeDataSource {
  Future<ApiResult<GetAllSubjectsResponse>> getAllSubjects();
}
