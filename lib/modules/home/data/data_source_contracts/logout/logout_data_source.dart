import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout/logout_entity.dart';

abstract interface class LogoutDataSource {
  Future<ApiResult<LogoutEntity>> logout();
}
