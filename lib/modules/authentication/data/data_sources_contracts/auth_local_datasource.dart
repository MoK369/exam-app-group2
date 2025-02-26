import '../../domain/entities/authentication/authentication_response_entity.dart';

abstract interface class AuthLocalDataSource {
  void cashUser({required AuthenticationResponseEntity authEntity});

  Future<AuthenticationResponseEntity?> getCashedUser();

  Future<void> deleteCachedUser();
}
