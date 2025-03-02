import 'package:exam_app_group2/core/api/api_excutor/api_excutor.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/api_manager/auth_api_manager.dart';
import 'package:exam_app_group2/modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart';
import 'package:exam_app_group2/modules/authentication/data/models/authentication/response/authentication_response.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImp implements SignUpRemoteDataSource {
  AuthApiManager apiManager;
  SignUpRemoteDataSourceImp({required this.apiManager});

  @override
  Future<ApiResult<AuthenticationResponseEntity>> signUp(
      {required SignUpRequestParameters signUpParameters}) async {
    var apiResult = await ApiExecutor.executeApi<AuthenticationResponseDto>(
        () => apiManager.signUp(signUpParameters: signUpParameters));
    switch (apiResult) {
      case Success<AuthenticationResponseDto>():
        var convertedResult = apiResult.data.convertIntoAuthenticationEntity();
        return Success(data: convertedResult);

      case Error<AuthenticationResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
