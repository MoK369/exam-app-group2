import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/change_password/data/data_source_contracts/change_password/change_password_local_data_source.dart';
import 'package:exam_app_group2/modules/change_password/data/data_source_contracts/change_password/change_password_remote_data_source.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/request/change_password_request_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/response/change_password_response_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/repositories_contracts/change_password/change_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImp implements ChangePasswordRepository {
  ChangePasswordRemoteDataSource changePasswordRemoteDataSource;
  ChangePasswordLocalDataSource changePasswordLocalDataSource;

  ChangePasswordRepositoryImp(
      this.changePasswordRemoteDataSource, this.changePasswordLocalDataSource);

  @override
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword(
      ChangePasswordRequestEntity requestEntity) async {
    var apiResult =
        await changePasswordRemoteDataSource.changePassword(requestEntity);
    if (apiResult is Success<ChangePasswordResponseEntity>) {
      await changePasswordLocalDataSource.updateToken(apiResult.data);
    }
    return apiResult;
  }
}
