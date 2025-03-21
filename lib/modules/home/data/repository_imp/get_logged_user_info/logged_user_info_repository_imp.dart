import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/get_logged_user_info/logged_user_info_remote_data_source.dart';
import 'package:exam_app_group2/modules/home/domain/entities/get_logged_user_info/logged_user_info_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/get_logged_user_info/logged_user_info_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoggedUserInfoRepository)
class LoggedUserInfoRepositoryImp implements LoggedUserInfoRepository {
  LoggedUserInfoRemoteDataSource loggedUserInfoRemoteDataSource;

  LoggedUserInfoRepositoryImp(this.loggedUserInfoRemoteDataSource);

  @override
  Future<ApiResult<LoggedUserInfoEntity>> getLoggedUserInfo() {
    return loggedUserInfoRemoteDataSource.getLoggedUserInfo();
  }
}
