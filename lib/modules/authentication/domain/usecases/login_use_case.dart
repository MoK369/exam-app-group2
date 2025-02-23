import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../../data/model/login/login_request.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<ApiResult<AuthenticationResponseEntity>> execute({
    required LoginRequest loginRequest,
  }) {
    return authRepo.login(
      loginRequest: loginRequest,
    );
  }

  Future<AuthenticationResponseEntity?> getLoginInfo() {
    return authRepo.getLoginInfo();
  }
}
