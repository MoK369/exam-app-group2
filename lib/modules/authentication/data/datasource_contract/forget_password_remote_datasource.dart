import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/forget_password_response_entity.dart';

abstract class ForgetPasswordRemoteDatasource {
  Future<ApiResult<ForgetPasswordResponseEntity>> forgotPassword(String email);
}
