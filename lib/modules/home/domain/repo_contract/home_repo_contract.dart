import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';

import '../../../../core/api/api_result/api_result.dart';

abstract interface class HomeRepo {
  Future<ApiResult<List<SubjectEntity>?>> getAllSubjects();
}
