import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjVlYmYwODZhMDI0ZjA2ZWEyODQ1NSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5OTc1NjY0fQ.wll3SYKM3pUxJvu4xEzHp_vN1j6No2xnk1ydyfTm9W0"
/// user : {"username":"mk11233","firstName":"Elevate","lastName":"Tech","email":"admn133@1elevate.com","phone":"01094155711","role":"user","isVerified":false,"_id":"67b5ebf086a024f06ea28455","createdAt":"2025-02-19T14:34:24.167Z"}

class AuthenticationResponseDto {
  AuthenticationResponseDto({
    this.message,
    this.token,
    this.user,
  });

  AuthenticationResponseDto.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
  }
  String? message;
  String? token;
  UserDto? user;

  AuthenticationResponseEntity convertIntoAuthenticationEntity() {
    return AuthenticationResponseEntity(
        message: message, token: token, user: user?.convertIntoUserEntity());
  }
}

/// username : "mk11233"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admn133@1elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// _id : "67b5ebf086a024f06ea28455"
/// createdAt : "2025-02-19T14:34:24.167Z"

class UserDto {
  UserDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  UserDto.fromJson(dynamic json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  String? createdAt;

  UserEntity convertIntoUserEntity() {
    return UserEntity(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        role: role,
        isVerified: isVerified,
        id: id,
        createdAt: createdAt);
  }
}
