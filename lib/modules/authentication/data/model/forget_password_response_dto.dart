import 'package:exam_app_group2/modules/authentication/domain/entity/forget_password_response_entity.dart';

class ForgetPasswordResponseDto {
  ForgetPasswordResponseDto({
    required this.message,
    required this.info,
  });

  final String? message;
  final String? info;

  factory ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponseDto(
      message: json["message"],
      info: json["info"],
    );
  }

  @override
  String toString() {
    return "$message, $info, ";
  }

  ForgetPasswordResponseEntity convertIntoEntity() {
    return ForgetPasswordResponseEntity(message: message, info: info);
  }
}
