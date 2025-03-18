class ForgetPasswordResponseEntity {
  ForgetPasswordResponseEntity({
    required this.message,
    required this.info,
  });

  final String? message;
  final String? info;

  @override
  String toString() {
    return "$message, $info, ";
  }
}
