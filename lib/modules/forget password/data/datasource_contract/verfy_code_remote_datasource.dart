import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/forget_password_response.dart';

abstract class VerfyCodeRemoteDatasource {

  Future<ApiResult<ForgotPasswordResponse>>  verfyCode(String code);

}