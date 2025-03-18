abstract interface class IsarStorageServiceCachedQuestionEntity<T> {
  Future<void> write(T object);

  Future<T?> findBy(String id);

  Future<List<T>?> get();
}
