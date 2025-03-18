import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/request/change_password_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_model.g.dart';

@JsonSerializable(createFactory: false)
class ChangePasswordRequestModel {
  ChangePasswordRequestModel({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  final String? oldPassword;
  final String? password;
  final String? rePassword;

  Map<String, dynamic> toJson() => _$ChangePasswordRequestModelToJson(this);

  @override
  String toString() {
    return "$oldPassword, $password, $rePassword, ";
  }

  static ChangePasswordRequestModel convertIntoThis(
      ChangePasswordRequestEntity changePasswordRequestEntity) {
    return ChangePasswordRequestModel(
        oldPassword: changePasswordRequestEntity.oldPassword,
        password: changePasswordRequestEntity.password,
        rePassword: changePasswordRequestEntity.rePassword);
  }
}

/*
{
	"oldPassword": "654321Hh@",
	"password": "654321Hh@",
	"rePassword": "654321Hh@"
}*/
