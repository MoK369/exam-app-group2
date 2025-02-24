import '../../../../core/api/api_result/api_result.dart';
import '../../data/model/login/login_request.dart';

abstract interface class AuthRepo {
  Future<ApiResult<void>> login({
    required LoginRequest loginRequest,
  });
}
