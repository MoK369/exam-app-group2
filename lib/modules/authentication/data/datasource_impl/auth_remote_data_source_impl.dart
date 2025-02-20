import 'package:exam_app_group2/modules/authentication/data/api/api_manager.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/auth_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/User_dm.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_request.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_excuter/api_excuter.dart';
import '../../../../core/api/api_result/api_result.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  @factoryMethod
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<ApiResult<LoginResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    return executeApi<LoginResponse>(() async {
      var loginResponse = await apiManager.login(
        loginRequest: loginRequest,
      );
      return loginResponse;
    });
  }
}
