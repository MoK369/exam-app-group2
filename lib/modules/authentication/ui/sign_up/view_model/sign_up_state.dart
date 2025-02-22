import 'package:equatable/equatable.dart';

enum SignUpStatus { initial, loading, success, error }

enum SignUpFormStatus { valid, unValid }

class SignUpState extends Equatable {
  final SignUpStatus signUpStatus;
  final SignUpFormStatus signUpFormStatus;
  final Object? signUpError;

  const SignUpState(
      {required this.signUpStatus,
      this.signUpError,
      this.signUpFormStatus = SignUpFormStatus.valid});

  @override
  List<Object?> get props =>
      [signUpStatus, signUpError, signUpFormStatus];

  SignUpState copyWith(
      {SignUpStatus? signUpStatus,
      SignUpFormStatus? signUpFormStatus,
      Object? signUpError}) {
    return SignUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      signUpError: signUpError ?? this.signUpError,
      signUpFormStatus: signUpFormStatus ?? this.signUpFormStatus,
    );
  }
}
