import 'package:exam_app_group2/storage/result/storage_result.dart';

abstract class StorageExecutor {
  static Future<StorageResult<T>> execute<T>(
      Future<T> Function() storageFunction) async {
    try {
      var result = await storageFunction();
      return StorageSuccessResult(data: result);
    } catch (e) {
      return StorageErrorResult(error: e);
    }
  }
}
