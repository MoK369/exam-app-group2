import 'package:exam_app_group2/modules/authentication/domain/entities/user/user_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/response/edit_profile_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class EditProfileResponseDto {
  EditProfileResponseDto({
    this.message,
    this.user,
  });

  final String? message;
  final UserDto? user;

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseDtoFromJson(json);

  @override
  String toString() {
    return "$message, $user, ";
  }

  EditProfileResponseEntity convertIntoEntity() {
    return EditProfileResponseEntity(
      message: message,
      user: user?.convertIntoEntity(),
    );
  }
}

@JsonSerializable(createToJson: false)
class UserDto {
  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
  });

  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final String? password;
  final bool? isVerified;
  final DateTime? createdAt;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  String toString() {
    return "$id, $username, $firstName, $lastName, $email, $phone, $role, $password, $isVerified, $createdAt, ";
  }

  UserEntity convertIntoEntity() {
    return UserEntity(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
    );
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
		"phone": "01094155711",
		"role": "user",
		"password": "$2b$08$HQ/VHZG449nk2XHqKv03JeYWRf4.ado49demTUCP7zpndrJqtoIv2",
		"isVerified": false,
		"createdAt": "2025-03-06T00:04:32.033Z"
	}
}*/
