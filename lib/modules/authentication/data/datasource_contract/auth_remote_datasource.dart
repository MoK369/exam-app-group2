import 'package:exam_app_group2/modules/authentication/data/model/login/User_dm.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_response.dart';

import '../../../../core/utils/result.dart';
import '../model/login/login_request.dart';

abstract class AuthRemoteDataSource {
  Future<Result<LoginResponse>> login({
    required LoginRequest loginRequest,
  });
}
