import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout_and_delete/logout_delete_entity.dart';

abstract interface class LogoutRepository {
  Future<ApiResult<LogoutAndDeleteEntity>> logout();
}
