import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/request/edit_profile_request_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/response/edit_profile_response_entity.dart';

abstract interface class EditProfileRepository {
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
      EditProfileRequestEntity editProfileRequestEntity);
}
