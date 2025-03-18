import 'package:exam_app_group2/core/api/api_excutor/api_excutor.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/edit_profile/data/api/api_client/edit_profile_api_client.dart';
import 'package:exam_app_group2/modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_remote_data_source.dart';
import 'package:exam_app_group2/modules/edit_profile/data/models/edit_profile/request/edit_profile_request_model.dart';
import 'package:exam_app_group2/modules/edit_profile/data/models/edit_profile/response/edit_profile_response_dto.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/request/edit_profile_request_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/response/edit_profile_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImp implements EditProfileRemoteDataSource {
  EditProfileApiClient editProfileApiClient;

  EditProfileRemoteDataSourceImp(this.editProfileApiClient);

  @override
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
      EditProfileRequestEntity editProfileRequestEntity) async {
    var apiResult = await ApiExecutor.executeApi(
      () {
        return editProfileApiClient.editProfile(
            EditProfileRequestModel.convertIntoThis(editProfileRequestEntity));
      },
    );
    switch (apiResult) {
      case Success<EditProfileResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<EditProfileResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
