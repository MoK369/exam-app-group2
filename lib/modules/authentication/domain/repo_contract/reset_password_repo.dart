import 'package:exam_app_group2/core/api/api_result/api_result.dart';

abstract class ResetPasswordRepo {
  Future<ApiResult<void>> resetPassword({required String mail , required String newPassword});
  
}