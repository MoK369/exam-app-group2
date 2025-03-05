import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/logout/logout_remote_data_source.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/logout_delete_account_local_data_source.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout_and_delete/logout_delete_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/logout/logout_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRepository)
class LogoutRepositoryImp implements LogoutRepository {
  LogoutRemoteDataSource logoutDataSource;
  LogoutDeleteAccountLocalDataSource logoutDeleteAccountLocalDataSource;

  LogoutRepositoryImp(
      this.logoutDataSource, this.logoutDeleteAccountLocalDataSource);

  @override
  Future<ApiResult<LogoutAndDeleteEntity>> logout() async {
    await logoutDeleteAccountLocalDataSource.deleteCachedUser();
    return logoutDataSource.logout();
  }
}
