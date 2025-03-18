import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/reset_password_response_entity.dart';

abstract class ResetPasswordRepo {
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      {required String mail, required String newPassword});
}