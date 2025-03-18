import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/reset_password_response_entity.dart';

abstract class ResetPasswordRemoteDataSource{
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      String email, String newPassword);
}