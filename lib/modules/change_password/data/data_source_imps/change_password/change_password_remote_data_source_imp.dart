import 'package:exam_app_group2/core/api/api_excutor/api_excutor.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/change_password/data/api/api_client/change_password_api_client.dart';
import 'package:exam_app_group2/modules/change_password/data/data_source_contracts/change_password/change_password_remote_data_source.dart';
import 'package:exam_app_group2/modules/change_password/data/models/change_password/request/change_password_request_model.dart';
import 'package:exam_app_group2/modules/change_password/data/models/change_password/response/change_password_response_dto.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/request/change_password_request_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/response/change_password_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRemoteDataSource)
class ChangePasswordRemoteDataSourceImp
    implements ChangePasswordRemoteDataSource {
  ChangePasswordApiClient changePasswordApiClient;

  ChangePasswordRemoteDataSourceImp(this.changePasswordApiClient);

  @override
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
      ChangePasswordRequestEntity changePasswordRequestEntity) async {
    var apiResult = await ApiExecutor.executeApi(
      () {
        return changePasswordApiClient.changePassword(
            ChangePasswordRequestModel.convertIntoThis(
                changePasswordRequestEntity));
      },
    );
    switch (apiResult) {
      case Success<ChangePasswordResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<ChangePasswordResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
