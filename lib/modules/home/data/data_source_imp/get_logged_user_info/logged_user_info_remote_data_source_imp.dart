import 'package:exam_app_group2/core/api/api_excutor/api_excutor.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/api/api_client/home_api_client.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/get_logged_user_info/logged_user_info_remote_data_source.dart';
import 'package:exam_app_group2/modules/home/data/models/get_logged_user_info/logged_user_info_dto.dart';
import 'package:exam_app_group2/modules/home/domain/entities/get_logged_user_info/logged_user_info_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoggedUserInfoRemoteDataSource)
class LoggedUserInfoRemoteDataSourceImp
    implements LoggedUserInfoRemoteDataSource {
  HomeApiClient homeApiClient;

  LoggedUserInfoRemoteDataSourceImp(this.homeApiClient);

  @override
  Future<ApiResult<LoggedUserInfoEntity>> getLoggedUserInfo() async {
    final apiResult = await ApiExecutor.executeApi(
      () {
        return homeApiClient.getLoggedUserInfo();
      },
    );
    switch (apiResult) {
      case Success<LoggedUserInfoDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<LoggedUserInfoDto>():
        return Error(error: apiResult.error);
    }
  }
}
