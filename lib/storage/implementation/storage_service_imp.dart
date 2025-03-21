import 'package:exam_app_group2/core/providers/error/error_notifier.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:exam_app_group2/storage/handler/storage_execution_handler.dart';
import 'package:exam_app_group2/storage/result/storage_result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: StorageService<FlutterSecureStorage>)
class StorageServiceImp implements StorageService<FlutterSecureStorage> {
  final FlutterSecureStorage storageInstance;
  final ErrorNotifier errorNotifier;

  StorageServiceImp(this.errorNotifier, this.storageInstance);

  @override
  void setStringValue(String key, String value,
      [String widgetName = ""]) async {
    var result = await StorageExecutionHandler.execute<void>(
        () => storageInstance.write(key: key, value: value));
    if (result is StorageErrorResult) {
      errorNotifier.setError(
          message:
              StorageConstants.errorStoringMessage(result.error.toString()),
          widgetName: widgetName);
    }
  }

  @override
  Future<String?> getStringValue(String key, [String widgetName = ""]) async {
    var storageResult = await StorageExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case StorageSuccessResult<String?>():
        return storageResult.data;
      case StorageErrorResult<String?>():
        errorNotifier.setError(
            message: StorageConstants.errorDeletingMessage(
                storageResult.error.toString()),
            widgetName: widgetName);
    }
    return null;
  }

  @override
  Future<void> deleteValue(String key, [String widgetName = ""]) async {
    var storageResult = await StorageExecutionHandler.execute(
      () => storageInstance.delete(key: key),
    );
    if (storageResult is StorageErrorResult) {
      errorNotifier.setError(
          message: StorageConstants.errorDeletingMessage(
              storageResult.error.toString()),
          widgetName: widgetName);
    }
  }
}
