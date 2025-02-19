import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repositories_constracts/sign_up/sign_up_repository.dart';

class SignUpRepositoryImp implements SignUpRepository {
  @override
  Future<ApiResult<AuthenticationResponseEntity>> signUp(
      {required SignUpRequestParameters signUpParameters}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
