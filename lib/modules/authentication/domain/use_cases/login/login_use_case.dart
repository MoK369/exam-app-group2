import 'package:exam_app_group2/modules/authentication/domain/repositories_contracts/login/login_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api/api_result/api_result.dart';
import '../../../data/models/login/login_request.dart';
import '../../entities/authentication/authentication_response_entity.dart';

@injectable
class LoginUseCase {
  LoginRepo _authRepo;

  LoginUseCase({required LoginRepo authRepo}) : _authRepo = authRepo;

  Future<ApiResult<AuthenticationResponseEntity>> execute({
    required LoginRequest loginRequest,
  }) {
    return _authRepo.login(
      loginRequest: loginRequest,
    );
  }

  Future<AuthenticationResponseEntity?> getLoginInfo() {
    return _authRepo.getLoginInfo();
  }

  Future<void> deleteUserInfo() {
    return _authRepo.deleteLoginInfo();
  }
}
