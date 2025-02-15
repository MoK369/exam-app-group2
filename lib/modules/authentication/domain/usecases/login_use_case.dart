import 'package:exam_app_group2/modules/authentication/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';

@injectable
class LoginUseCase {
  AuthRepo repo;

  @factoryMethod
  LoginUseCase({required this.repo});

  Future<Result<void>> execute({
    required String email,
    required String password,
  }) {
    return repo.login(
      email: email,
      password: password,
    );
  }
}
