import 'package:exam_app_group2/modules/authentication/data/model/login/User_dm.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_response.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../model/login/login_request.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<AuthenticationResponseEntity>> login({
    required LoginRequest loginRequest,
  });
}
