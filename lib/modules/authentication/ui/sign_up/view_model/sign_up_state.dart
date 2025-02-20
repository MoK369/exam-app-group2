import 'package:equatable/equatable.dart';

enum SignUpStatus { initial, loading, success, error }

class SignUpState extends Equatable {
  final SignUpStatus signUpStatus;
  final String? signUpErrorMessage;

  const SignUpState({required this.signUpStatus, this.signUpErrorMessage});

  @override
  List<Object?> get props => [signUpStatus,signUpErrorMessage];
}
