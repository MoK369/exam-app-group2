import '../../../../../core/api/api_result/api_result.dart';
import '../../../domain/entities/authentication/authentication_response_entity.dart';
import '../../models/login/login_request.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResult<AuthenticationResponseEntity>> login({
    required LoginRequest loginRequest,
  });
}
