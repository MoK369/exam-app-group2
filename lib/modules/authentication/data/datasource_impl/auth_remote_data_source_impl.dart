import 'package:exam_app_group2/core/api/api_executor/api_executor.dart';
import 'package:exam_app_group2/modules/authentication/data/api/api_manager.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/auth_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/model/authentication/response/authentication_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_request.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_result/api_result.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});

  // Where did the conversion happen dto => entity
  // Future<ApiResult<LoginResponse>> login({
  //     required LoginRequest loginRequest,
  //   })
  @override
  Future<ApiResult<AuthenticationResponseEntity>> login({
    required LoginRequest loginRequest,
  }) async {
    var apiResult =
        await executeApi<AuthenticationResponseDto>(() => apiManager.login(
              loginRequest: loginRequest,
            ));
    switch (apiResult) {
      case Success<AuthenticationResponseDto>():
        return Success(data: apiResult.data.convertIntoAuthenticationEntity());
      case Error<AuthenticationResponseDto>():
        return Error(apiErrorModel: apiResult.apiErrorModel);
    }
  }
}
