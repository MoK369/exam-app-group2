import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/edit_profile/data/models/edit_profile/request/edit_profile_request_model.dart';
import 'package:exam_app_group2/modules/edit_profile/data/models/edit_profile/response/edit_profile_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'edit_profile_api_client.g.dart';

@RestApi()
abstract interface class EditProfileApiClient {
  factory EditProfileApiClient(Dio dio) = _EditProfileApiClient;

  @PUT('api/v1/auth/editProfile')
  Future<EditProfileResponseDto> editProfile(
      @Body() EditProfileRequestModel editProfileRequestModel);
}
