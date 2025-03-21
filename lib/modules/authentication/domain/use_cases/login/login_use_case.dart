import 'package:exam_app_group2/modules/authentication/domain/repositories_contracts/login/login_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_result/api_result.dart';
import '../../../data/models/login/login_request.dart';
import '../../entities/authentication/authentication_response_entity.dart';

@injectable
class LoginUseCase {
  LoginRepo _loginRepo;

  LoginUseCase({required LoginRepo authRepo}) : _loginRepo = authRepo;

  Future<ApiResult<AuthenticationResponseEntity>> execute({
    required LoginRequest loginRequest,
  }) {
    return _loginRepo.login(
      loginRequest: loginRequest,
    );
  }

  Future<AuthenticationResponseEntity?> getStoredLoginInfo() {
    return _loginRepo.getStoredLoginInfo();
  }

  Future<void> deleteUserInfo() {
    return _loginRepo.deleteLoginInfo();
  }
}
