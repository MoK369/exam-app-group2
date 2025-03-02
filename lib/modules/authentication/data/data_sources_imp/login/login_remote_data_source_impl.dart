import 'package:exam_app_group2/core/api/api_excutor/api_excutor.dart';
import 'package:exam_app_group2/modules/authentication/data/api_manager/auth_api_manager.dart';
import 'package:exam_app_group2/modules/authentication/data/data_sources_contracts/login/login_remote_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_result/api_result.dart';
import '../../../domain/entities/authentication/authentication_response_entity.dart';
import '../../models/authentication/response/authentication_response.dart';
import '../../models/login/login_request.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  AuthApiManager apiManager;

  LoginRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<ApiResult<AuthenticationResponseEntity>> login({
    required LoginRequest loginRequest,
  }) async {
    var apiResult = await ApiExecutor.executeApi<AuthenticationResponseDto>(
        () => apiManager.login(
              loginRequest: loginRequest,
            ));
    switch (apiResult) {
      case Success<AuthenticationResponseDto>():
        return Success(data: apiResult.data.convertIntoAuthenticationEntity());
      case Error<AuthenticationResponseDto>():
        return Error(
          error: apiResult.error,
        );
    }
  }
}
