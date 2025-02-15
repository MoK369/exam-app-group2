import '../../../../core/utils/result.dart';

abstract class AuthDataSource {
  Future<Result<void>> login({
    required String email,
    required String password,
  });
}
