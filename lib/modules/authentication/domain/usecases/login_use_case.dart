import 'package:exam_app_group2/modules/authentication/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../../data/model/login/login_request.dart';

@injectable
class LoginUseCase {
  AuthRepo repo;

  @factoryMethod
  LoginUseCase({required this.repo});

  Future<Result<void>> execute({
    required LoginRequest loginRequest,
  }) {
    return repo.login(
      loginRequest: loginRequest,
    );
  }
}
