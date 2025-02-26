import 'package:exam_app_group2/modules/authentication/data/data_sources_contracts/auth_local_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/data_sources_contracts/login/login_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/domain/repositories_constracts/login/login_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_result/api_result.dart';
import '../../../domain/entities/authentication/authentication_response_entity.dart';
import '../../models/login/login_request.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  LoginRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;

  LoginRepoImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<ApiResult<AuthenticationResponseEntity>> login({
    required LoginRequest loginRequest,
  }) async {
    var result = await authRemoteDataSource.login(
      loginRequest: loginRequest,
    );
    switch (result) {
      case Success<AuthenticationResponseEntity>():
        authLocalDataSource.cashUser(authEntity: result.data);
        return Success(data: result.data);
      case Error<AuthenticationResponseEntity>():
        return Error(
          error: result.error,
        );
    }
  }

  @override
  Future<AuthenticationResponseEntity?> getLoginInfo() {
    return authLocalDataSource.getCashedUser();
  }

  @override
  Future<void> deleteLoginInfo() {
    return authLocalDataSource.deleteCachedUser();
  }
}
