import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/request/change_password_request_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/response/change_password_response_entity.dart';

abstract interface class ChangePasswordRepository {
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
      ChangePasswordRequestEntity requestEntity);
}
