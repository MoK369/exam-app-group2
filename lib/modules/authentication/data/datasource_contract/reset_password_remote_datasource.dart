import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/model/reset_password_response.dart';

abstract class ResetPasswordRemoteDataSource{

  Future<ApiResult<ResetPasswordResponse>> resetPassword(String email , String newPassword);


}