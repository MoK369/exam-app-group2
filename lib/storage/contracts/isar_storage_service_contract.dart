abstract interface class IsarStorageService<T> {
  Future<void> write(T object);

  Future<T?> findBy(String id);

  Future<void> updateEmail(
      {required String oldEmailId, required String newEmailId});

  Future<void> delete(int id);
}
