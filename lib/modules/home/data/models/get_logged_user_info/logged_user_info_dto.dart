import 'package:exam_app_group2/modules/home/data/models/user/user_dto.dart';
import 'package:exam_app_group2/modules/home/domain/entities/get_logged_user_info/logged_user_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logged_user_info_dto.g.dart';

@JsonSerializable(createToJson: false)
class LoggedUserInfoDto {
  LoggedUserInfoDto({
    required this.message,
    required this.user,
  });

  final String? message;
  final UserDto? user;

  factory LoggedUserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$LoggedUserInfoDtoFromJson(json);

  @override
  String toString() {
    return "$message, $user, ";
  }

  LoggedUserInfoEntity convertIntoEntity() {
    return LoggedUserInfoEntity(
        message: message, user: user?.convertIntoEntity());
  }
}

/*
{
	"message": "success",
	"user": {
		"_id": "67c8e6905554b32891260965",
		"username": "Mo369",
		"firstName": "mohammed",
		"lastName": "khalil",
		"email": "klilmohammed9@gmail.com",
		"phone": "01010518801",
		"role": "user",
		"isVerified": false,
		"createdAt": "2025-03-06T00:04:32.033Z",
		"passwordChangedAt": "2025-03-07T21:00:49.148Z"
	}
}*/
