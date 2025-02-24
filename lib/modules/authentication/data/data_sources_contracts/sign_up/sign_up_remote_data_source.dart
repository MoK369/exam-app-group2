import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';

abstract class SignUpRemoteDataSource {
  Future<ApiResult<AuthenticationResponseEntity>> signUp(
      {required SignUpRequestParameters signUpParameters});
}
