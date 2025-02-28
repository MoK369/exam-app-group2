import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:exam_app_group2/storage/handler/storage_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: StorageService<FlutterSecureStorage>)
class StorageServiceImp implements StorageService<FlutterSecureStorage> {
  late final FlutterSecureStorage storageInstance;
  StorageServiceImp() {
    initStorage();
  }
  @override
  void initStorage() {
    storageInstance = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  void setStringValue(String key, dynamic value) {
    StorageExecutor.execute<void>(
        () => storageInstance.write(key: key, value: value));
  }

  @override
  Future<String?> getStringValue(String key) {
    return storageInstance.read(key: key);
  }

  @override
  Future<void> deleteValue(String key) {
    return storageInstance.delete(key: key);
  }
}
