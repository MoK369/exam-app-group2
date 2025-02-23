import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';


@Singleton(as: StorageService<FlutterSecureStorage>)
class StorageServiceImp implements StorageService<FlutterSecureStorage> {
  @override
  late FlutterSecureStorage _storageInstance;

  @override
  Future<void> initStorage() async {
    _storageInstance = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  void setStringValue(String key, String value) {
    _storageInstance.write(key: key, value: value);
  }

  @override
  Future<String?> getStringValue(String key) {
    return _storageInstance.read(key: key);
  }

  @override
  Future<void> deleteValue(String key) {
    return _storageInstance.delete(key: key);
  }
}
