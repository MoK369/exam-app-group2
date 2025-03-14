import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/response/change_password_response_entity.dart';

abstract interface class ChangePasswordLocalDataSource {
  Future<AuthenticationResponseEntity> getCachedToken();

  Future<void> updateToken(
      ChangePasswordResponseEntity changePasswordResponseEntity);

  Future<void> cacheToken(AuthenticationResponseEntity authEntity);
}
