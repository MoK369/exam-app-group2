import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/core/api/api_error/api_error_model.dart';

enum Status {
  initial,
  loading,
  success,
  error,
}

extension VerifyEmailStatusEx on VerifyEmailState {
  bool get isInitial => emailVerificationStatus == Status.initial;

  bool get isLoading => emailVerificationStatus == Status.loading;

  bool get isSuccess => emailVerificationStatus == Status.success;

  bool get isError => emailVerificationStatus == Status.error;
}

class VerifyEmailState extends Equatable {
  final Status emailVerificationStatus;
  final Status resendCodeStatus;
  final Object? error;

  const VerifyEmailState({
    this.emailVerificationStatus = Status.initial,
    this.resendCodeStatus = Status.initial,
    this.error,
  });

  VerifyEmailState copyWith({
    Status? emailVerificationStatus,
    Status? resendCodeStatus,
    Object? error,
  }) {
    return VerifyEmailState(
      emailVerificationStatus:
          emailVerificationStatus ?? this.emailVerificationStatus,
      resendCodeStatus: resendCodeStatus ?? this.resendCodeStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [emailVerificationStatus, error];
}
