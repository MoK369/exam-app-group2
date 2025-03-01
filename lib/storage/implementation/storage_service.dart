import 'package:exam_app_group2/core/providers/error/error_notifier.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:exam_app_group2/storage/handler/storage_handler.dart';
import 'package:exam_app_group2/storage/result/storage_result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: StorageService<FlutterSecureStorage>)
class StorageServiceImp implements StorageService<FlutterSecureStorage> {
  late final FlutterSecureStorage storageInstance;
  final ErrorNotifier errorNotifier;
  StorageServiceImp(this.errorNotifier) {
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
  void setStringValue(String key, String value) async {
    var result = await StorageExecutor.execute<void>(
        () => storageInstance.write(key: key, value: value));
    if (result is StorageErrorResult) {
      errorNotifier.setError(
          StorageConstants.errorStoringMessage(result.error.toString()));
    }
  }

  @override
  Future<String?> getStringValue(String key) async {
    var storageResult = await StorageExecutor.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case StorageSuccessResult<String?>():
        return storageResult.data;
      case StorageErrorResult<String?>():
        errorNotifier.setError(StorageConstants.errorDeletingMessage(
            storageResult.error.toString()));
    }
    return null;
  }

  @override
  Future<void> deleteValue(String key) async {
    var storageResult = await StorageExecutor.execute(
      () => storageInstance.delete(key: key),
    );
    if (storageResult is StorageErrorResult) {
      errorNotifier.setError(StorageConstants.errorDeletingMessage(
          storageResult.error.toString()));
    }
  }
}
