abstract interface class IsarStorageService<T> {
  Future<void> write(T object);

  Future<List<T>> getAllObjects();
}
