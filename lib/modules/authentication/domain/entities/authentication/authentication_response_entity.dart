import 'package:exam_app_group2/modules/authentication/domain/entities/user/user_entity.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjVlYmYwODZhMDI0ZjA2ZWEyODQ1NSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5OTc1NjY0fQ.wll3SYKM3pUxJvu4xEzHp_vN1j6No2xnk1ydyfTm9W0"
/// user : {"username":"mk11233","firstName":"Elevate","lastName":"Tech","email":"admn133@1elevate.com","phone":"01094155711","role":"user","isVerified":false,"_id":"67b5ebf086a024f06ea28455","createdAt":"2025-02-19T14:34:24.167Z"}

class AuthenticationResponseEntity {
  AuthenticationResponseEntity({
    this.message,
    this.token,
    this.user,
  });
  String? message;
  String? token;
  UserEntity? user;
}
