
abstract interface class StorageService<T> {
  void initStorage();

  void setStringValue(String key, String value);

  Future<String?> getStringValue(String key);

  Future<void> deleteValue(String key);
}
