import 'package:exam_app_group2/modules/authentication/data/datasource_contract/auth_local_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/auth_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_request.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_result/api_result.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  // make it return the authentication response
  //Future<ApiResult<void>> login({
  //     required LoginRequest loginRequest,
  //   })
  @override
  Future<ApiResult<AuthenticationResponseEntity>> login({
    required LoginRequest loginRequest,
  }) async {
    var result = await authRemoteDataSource.login(
      loginRequest: loginRequest,
    );
    switch (result) {
      // case Success<LoginResponse>():
      //   authLocalDataSource.cashUser(
      //     user: result.data.user,
      //     token: result.data.token,
      //   );
      // case Error<LoginResponse>():
      case Success<AuthenticationResponseEntity>():
        authLocalDataSource.cashUser(authEntity: result.data);
        return Success(data: result.data);
      case Error<AuthenticationResponseEntity>():
        return Error(apiErrorModel: result.apiErrorModel);
    }
  }

  @override
  Future<AuthenticationResponseEntity?> getLoginInfo() {
    return authLocalDataSource.getCashedUser();
  }
}
