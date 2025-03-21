import 'package:exam_app_group2/modules/authentication/domain/entities/user/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(createToJson: false)
class UserDto {
  UserDto({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.createdAt,
    required this.passwordChangedAt,
  });

  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? passwordChangedAt;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  String toString() {
    return "$id, $username, $firstName, $lastName, $email, $phone, $role, $isVerified, $createdAt, $passwordChangedAt, ";
  }

  UserEntity convertIntoEntity() {
    return UserEntity(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}
