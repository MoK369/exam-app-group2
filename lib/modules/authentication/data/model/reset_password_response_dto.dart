import 'package:exam_app_group2/modules/authentication/domain/entity/reset_password_response_entity.dart';

class ResetPasswordResponseDto {
  ResetPasswordResponseDto({
    this.message,
    this.token,
  });

  ResetPasswordResponseDto.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }

  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

  ResetPasswordResponseEntity convertIntoEntity() {
    return ResetPasswordResponseEntity(message: message, token: token);
  }
}
