import 'package:exam_app_group2/modules/authentication/domain/entities/user/user_entity.dart';

class EditProfileResponseEntity {
  EditProfileResponseEntity({
    this.message,
    this.user,
  });

  final String? message;
  final UserEntity? user;

  @override
  String toString() {
    return "$message, $user, ";
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
