abstract interface class IsarStorageService<T> {
  Future<void> write(T object);

  Future<T?> findBy(String id);

  Future<void> updateEmail(String emailId);

  Future<void> delete(int id);
}
