abstract class StorageService<T> {
  late T _storageInstance;
  Future<void> initStorage();

  void setStringValue(String key, String value);

  Future<String?> getStringValue(String key);

  Future<void> deleteValue(String key);
}
