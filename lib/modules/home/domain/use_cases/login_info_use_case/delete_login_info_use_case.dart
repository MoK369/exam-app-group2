import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteLoginInfoUseCase {
  StorageService<FlutterSecureStorage> _storageService;
  DeleteLoginInfoUseCase(this._storageService);

  Future<void> invoke() {
    return _storageService.deleteValue(StorageConstants.authModelKey);
  }
}
