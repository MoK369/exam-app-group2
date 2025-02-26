import '../../../../../core/api/api_result/api_result.dart';
import '../../../data/models/login/login_request.dart';
import '../../entities/authentication/authentication_response_entity.dart';

abstract class LoginRepo {
  Future<ApiResult<AuthenticationResponseEntity>> login({
    required LoginRequest loginRequest,
  });

  Future<AuthenticationResponseEntity?> getLoginInfo();

  Future<void> deleteLoginInfo();
}
