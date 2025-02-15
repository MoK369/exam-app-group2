import '../../../../core/utils/result.dart';

abstract class AuthRepo {
  Future<Result<void>> login({
    required String email,
    required String password,
  });
}
