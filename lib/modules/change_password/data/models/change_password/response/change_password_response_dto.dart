import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/response/change_password_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class ChangePasswordResponseDto {
  ChangePasswordResponseDto({
    this.message,
    this.token,
  });

  final String? message;
  final String? token;

  factory ChangePasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseDtoFromJson(json);

  @override
  String toString() {
    return "$message, $token, ";
  }

  ChangePasswordResponseEntity convertIntoEntity() {
    return ChangePasswordResponseEntity(message: message, token: token);
  }
}

/*
{
	"message": "success",
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YzhlNjkwNTU1NGIzMjg5MTI2MDk2NSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQxNDY0MTA4fQ.FNLRgOuuStzWeVRUV-DFxJcHWyoA9zIOkFu491eYSKE"
}*/
