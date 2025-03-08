class EditProfileRequestEntity {
  EditProfileRequestEntity({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;

  final String? phone;

  @override
  String toString() {
    return "$username, $firstName, $lastName, $email, $phone, ";
  }
}
