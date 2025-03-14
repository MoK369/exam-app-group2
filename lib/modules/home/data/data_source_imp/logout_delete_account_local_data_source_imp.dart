import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/home/data/data_source_contracts/logout_delete_account_local_data_source.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutDeleteAccountLocalDataSource)
class LogoutDeleteAccountLocalDataSourceImp
    implements LogoutDeleteAccountLocalDataSource {
  StorageService<FlutterSecureStorage> _storageService;

  LogoutDeleteAccountLocalDataSourceImp(this._storageService);

  @override
  Future<void> deleteCachedUser() {
    return _storageService.deleteValue(
        StorageConstants.authModelKey, HomeScreen.widgetName);
  }
}
