sealed class StorageResult<T> {}

class StorageSuccessResult<T> extends StorageResult<T> {
  T data;
  StorageSuccessResult({required this.data});
}

class StorageErrorResult extends StorageResult {
  Object error;
  StorageErrorResult({required this.error});
}
