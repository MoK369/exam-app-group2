import 'package:exam_app_group2/core/utils/result.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/auth_datasource.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthDataSource authDataSource;

  @factoryMethod
  AuthRepoImpl({
    required this.authDataSource,
  });

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) {
    return authDataSource.login(
      email: email,
      password: password,
    );
  }
}
