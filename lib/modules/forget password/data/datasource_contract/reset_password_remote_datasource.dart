import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/reset_password_response.dart';

import 'package:exam_app_group2/modules/forget%20password/domain/entity/reset_password_entity.dart';

abstract class ResetPasswordRemoteDataSource{

  Future<ApiResult<ResetPasswordResponse>> resetPassword(String email , String newPassword);


}