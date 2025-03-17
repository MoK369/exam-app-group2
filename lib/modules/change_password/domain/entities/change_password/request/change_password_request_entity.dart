class ChangePasswordRequestEntity {
  ChangePasswordRequestEntity({
    this.oldPassword,
    this.password,
    this.rePassword,
  });

  final String? oldPassword;
  final String? password;
  final String? rePassword;

  @override
  String toString() {
    return "$oldPassword, $password, $rePassword, ";
  }
}

/*
{
	"oldPassword": "654321Hh@",
	"password": "654321Hh@",
	"rePassword": "654321Hh@"
}*/
