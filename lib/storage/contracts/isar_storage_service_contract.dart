abstract interface class IsarStorageService<T> {
  Future<void> write(T object);

  Future<T?> findBy(String id);

  Future<List<T>> readAll();

  Future<void> delete(int id);
}
