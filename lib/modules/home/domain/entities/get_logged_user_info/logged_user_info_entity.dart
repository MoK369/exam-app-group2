import 'package:exam_app_group2/modules/authentication/domain/entities/user/user_entity.dart';

class LoggedUserInfoEntity {
  LoggedUserInfoEntity({
    required this.message,
    required this.user,
  });

  final String? message;
  final UserEntity? user;

  @override
  String toString() {
    return "$message, $user, ";
  }
}
