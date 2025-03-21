// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseDto _$EditProfileResponseDtoFromJson(
        Map<String, dynamic> json) =>
    EditProfileResponseDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as String?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );
