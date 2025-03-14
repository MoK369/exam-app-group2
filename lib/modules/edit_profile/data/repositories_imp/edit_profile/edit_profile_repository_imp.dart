import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_local_data_source.dart';
import 'package:exam_app_group2/modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_remote_data_source.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/request/edit_profile_request_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/response/edit_profile_response_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/repositories_contracts/edit_profile/edit_profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImp implements EditProfileRepository {
  EditProfileRemoteDataSource editProfileRemoteDataSource;
  EditProfileLocalDataSource editProfileLocalDataSource;

  EditProfileRepositoryImp(
      this.editProfileRemoteDataSource, this.editProfileLocalDataSource);

  @override
  Future<ApiResult<EditProfileResponseEntity>> editProfile(
      EditProfileRequestEntity editProfileRequestEntity) async {
    var apiResult =
        await editProfileRemoteDataSource.editProfile(editProfileRequestEntity);
    if (apiResult is Success<EditProfileResponseEntity>) {
      await editProfileLocalDataSource
          .updateCachedUser(editProfileRequestEntity);
    }
    return apiResult;
  }
}
