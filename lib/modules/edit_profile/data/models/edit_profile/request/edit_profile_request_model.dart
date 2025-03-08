import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/request/edit_profile_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_model.g.dart';

@JsonSerializable(createFactory: false)
class EditProfileRequestModel {
  EditProfileRequestModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @JsonKey(includeIfNull: false)
  final String? username;
  @JsonKey(includeIfNull: false)
  final String? firstName;
  @JsonKey(includeIfNull: false)
  final String? lastName;
  @JsonKey(includeIfNull: false)
  final String? email;

  @JsonKey(includeIfNull: false)
  final String? phone;

  Map<String, dynamic> toJson() => _$EditProfileRequestModelToJson(this);

  @override
  String toString() {
    return "$username, $firstName, $lastName, $email, $phone, ";
  }

  static EditProfileRequestModel convertIntoThis(
      EditProfileRequestEntity requestEntity) {
    return EditProfileRequestModel(
        username: requestEntity.username,
        firstName: requestEntity.firstName,
        lastName: requestEntity.lastName,
        email: requestEntity.email,
        phone: requestEntity.phone);
  }
}
