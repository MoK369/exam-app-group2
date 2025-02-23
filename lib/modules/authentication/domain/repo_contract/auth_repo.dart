
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../../data/model/login/login_request.dart';

abstract class AuthRepo {
  Future<ApiResult<AuthenticationResponseEntity>> login({
    required LoginRequest loginRequest,
  });
}
