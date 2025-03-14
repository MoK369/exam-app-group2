import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/delete_account/delete_account_remote_data_source.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/logout_delete_account_local_data_source.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout_and_delete/logout_delete_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/delete_account/delete_account_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeleteAccountRepository)
class DeleteAccountRepositoryImp implements DeleteAccountRepository {
  DeleteAccountRemoteDataSource deleteAccountRemoteDataSource;
  LogoutDeleteAccountLocalDataSource logoutDeleteAccountLocalDataSource;

  DeleteAccountRepositoryImp(this.deleteAccountRemoteDataSource,
      this.logoutDeleteAccountLocalDataSource);

  @override
  Future<ApiResult<LogoutAndDeleteEntity>> deleteAccount() async {
    await logoutDeleteAccountLocalDataSource.deleteCachedUser();
    return deleteAccountRemoteDataSource.deleteAccount();
  }
}
