class ChangePasswordResponseEntity {
  ChangePasswordResponseEntity({
    this.message,
    this.token,
  });

  final String? message;
  final String? token;

  @override
  String toString() {
    return "$message, $token, ";
  }
}

/*
{
	"message": "success",
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YzhlNjkwNTU1NGIzMjg5MTI2MDk2NSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQxNDY0MTA4fQ.FNLRgOuuStzWeVRUV-DFxJcHWyoA9zIOkFu491eYSKE"
}*/
