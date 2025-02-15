import 'package:exam_app_group2/core/utils/result.dart';
import 'package:exam_app_group2/modules/authentication/data/api/api_executer.dart';
import 'package:exam_app_group2/modules/authentication/data/api/api_manager.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/auth_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;

  @factoryMethod
  AuthDataSourceImpl({required this.apiManager});

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    return executeApi<void>(() async {
      await apiManager.login(
        email: email,
        password: password,
      );
    });
  }
}
