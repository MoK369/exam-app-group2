import 'package:exam_app_group2/core/api/api_excutor/api_excutor.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/api/api_client/home_api_client.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/logout/logout_remote_data_source.dart';
import 'package:exam_app_group2/modules/home/data/models/logout_and_delete/logout_and_delete_response_dto.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout_and_delete/logout_delete_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRemoteDataSource)
class LogoutRemoteDataSourceImp implements LogoutRemoteDataSource {
  HomeApiClient _homeApiClient;

  LogoutRemoteDataSourceImp(this._homeApiClient);

  @override
  Future<ApiResult<LogoutAndDeleteEntity>> logout() async {
    var logoutResult = await ApiExecutor.executeApi<LogoutAndDeleteResponseDto>(
      () {
        return _homeApiClient.logout();
      },
    );
    switch (logoutResult) {
      case Success<LogoutAndDeleteResponseDto>():
        return Success(data: logoutResult.data.convertIntoEntity());
      case Error<LogoutAndDeleteResponseDto>():
        return Error(error: logoutResult.error);
    }
  }
}
