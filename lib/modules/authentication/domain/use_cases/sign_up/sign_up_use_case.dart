import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repositories_contracts/sign_up/sign_up_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpRepository signUpRepository;

  SignUpUseCase({required this.signUpRepository});

  Future<ApiResult<AuthenticationResponseEntity>> invoke(
      {required SignUpRequestParameters signUpParameters}) {
    return signUpRepository.signUp(signUpParameters: signUpParameters);
  }
}
