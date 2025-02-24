import 'package:exam_app_group2/modules/authentication/data/model/login/user_dm.dart';

abstract interface class AuthLocalDataSource {
  Future<void> cashUser({
    required UserDM? user,
    required String? token,
  });

  Future<String?> getCashedUser();
}
