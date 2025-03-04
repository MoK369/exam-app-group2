import 'package:exam_app_group2/core/api/api_excutor/api_excutor.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/api/api_client/home_api_client.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/logout/logout_data_source.dart';
import 'package:exam_app_group2/modules/home/data/models/logout/logout_response_dto.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout/logout_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeDataSourceImp implements LogoutDataSource {
  HomeApiClient homeApiClient;

  HomeDataSourceImp(this.homeApiClient);

  @override
  Future<ApiResult<LogoutEntity>> logout() async {
    var logoutResult = await ApiExecutor.executeApi<LogoutResponseDto>(
      () {
        return homeApiClient.logout();
      },
    );
    switch (logoutResult) {
      case Success<LogoutResponseDto>():
        return Success(data: logoutResult.data.convertIntoEntity());
      case Error<LogoutResponseDto>():
        return Error(error: logoutResult.error);
    }
  }
}
