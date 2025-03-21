import 'package:equatable/equatable.dart';


enum ForgotPasswordStatus {
  initial,
  loading,
  success,
  error,
}

enum FormStatus { valid, unValid }

extension ForgotPasswordStatusEx on ForgetPasswordState {
  bool get isInitial => forgetPasswordStatus == ForgotPasswordStatus.initial;

  bool get isLoading => forgetPasswordStatus == ForgotPasswordStatus.loading;

  bool get isSuccess => forgetPasswordStatus == ForgotPasswordStatus.success;

  bool get isError => forgetPasswordStatus == ForgotPasswordStatus.error;
}

class ForgetPasswordState extends Equatable {
  ForgotPasswordStatus forgetPasswordStatus;
  FormStatus formStatus;
  Object? error;

  ForgetPasswordState({
    this.forgetPasswordStatus = ForgotPasswordStatus.initial,
    this.formStatus = FormStatus.valid,
    this.error,
  });

  ForgetPasswordState copyWith({
    ForgotPasswordStatus? forgetPasswordStatus,
    FormStatus? formStatus,
    Object? error,
  }) {
    return ForgetPasswordState(
      forgetPasswordStatus: forgetPasswordStatus ?? this.forgetPasswordStatus,
      formStatus: formStatus ?? this.formStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [forgetPasswordStatus, error, formStatus];
}
