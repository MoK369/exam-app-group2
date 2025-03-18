import 'package:equatable/equatable.dart';

enum ResetPasswordStatus {
  initial,
  loading,
  success,
  error,
}

enum FormStatus { valid, unValid }

extension ResetPasswordStatusEx on ResetPasswordState {
  bool get isInitial => resetPasswordStatus == ResetPasswordStatus.initial;

  bool get isLoading => resetPasswordStatus == ResetPasswordStatus.loading;

  bool get isSuccess => resetPasswordStatus == ResetPasswordStatus.success;

  bool get isError => resetPasswordStatus == ResetPasswordStatus.error;
}

class ResetPasswordState extends Equatable {
  final ResetPasswordStatus resetPasswordStatus;

  final FormStatus formStatus;
  final Object? error;

  const ResetPasswordState({
    this.resetPasswordStatus = ResetPasswordStatus.initial,
    this.formStatus = FormStatus.valid,
    this.error,
  });

  ResetPasswordState copyWith({
    ResetPasswordStatus? resetPasswordStatus,
    Object? error,
    FormStatus? formStatus,
  }) {
    return ResetPasswordState(
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      formStatus: formStatus ?? this.formStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [resetPasswordStatus, formStatus, error];
}
