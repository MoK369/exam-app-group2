import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';

abstract class AuthLocalDataSource {
  void cashUser({required AuthenticationResponseEntity authEntity});

  Future<AuthenticationResponseEntity?> getCashedUser();
}
