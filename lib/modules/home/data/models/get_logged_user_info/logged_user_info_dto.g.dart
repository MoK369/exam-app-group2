// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUserInfoDto _$LoggedUserInfoDtoFromJson(Map<String, dynamic> json) =>
    LoggedUserInfoDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );
