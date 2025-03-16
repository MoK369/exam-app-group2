import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/entity/reset_password_entity.dart';

abstract class ResetPasswordRepo {
  Future<ApiResult<void>> resetPassword({required String mail , required String newPassword});
  
}