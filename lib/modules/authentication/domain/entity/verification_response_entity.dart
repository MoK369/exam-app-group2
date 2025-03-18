class VerificationResponseEntity {
  VerificationResponseEntity({
    required this.status,
  });

  final String? status;

  @override
  String toString() {
    return "$status, ";
  }
}
