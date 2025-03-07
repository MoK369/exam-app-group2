abstract interface class IsarStorageService<T> {
  Future<void> write(T object);

  Future<T?> get(String examId);
}
