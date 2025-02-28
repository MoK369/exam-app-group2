abstract class StorageService<T> {
  void initStorage();

  void setStringValue(String key, dynamic value);

  Future<String?> getStringValue(String key);

  Future<void> deleteValue(String key);
}
