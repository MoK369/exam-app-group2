import 'package:exam_app_group2/core/api/api_excutor/api_excutor.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/api/api_client/home_api_client.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/delete_account/delete_account_remote_data_source.dart';
import 'package:exam_app_group2/modules/home/data/models/logout_and_delete/logout_and_delete_response_dto.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout_and_delete/logout_delete_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeleteAccountRemoteDataSource)
class DeleteAccountRemoteDataSourceImp
    implements DeleteAccountRemoteDataSource {
  HomeApiClient homeApiClient;

  DeleteAccountRemoteDataSourceImp(this.homeApiClient);

  @override
  Future<ApiResult<LogoutAndDeleteEntity>> deleteAccount() async {
    var apiResult = await ApiExecutor.executeApi(
      () {
        return homeApiClient.deleteAccount();
      },
    );
    switch (apiResult) {
      case Success<LogoutAndDeleteResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<LogoutAndDeleteResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
