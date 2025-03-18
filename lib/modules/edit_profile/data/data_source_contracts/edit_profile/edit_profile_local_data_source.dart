import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/request/edit_profile_request_entity.dart';

abstract interface class EditProfileLocalDataSource {
  Future<AuthenticationResponseEntity> getCachedUser();

  Future<void> updateCachedUser(EditProfileRequestEntity newEntity);

  Future<void> cacheUser(AuthenticationResponseEntity authEntity);
}
