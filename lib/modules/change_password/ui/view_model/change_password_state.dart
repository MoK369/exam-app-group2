import 'package:equatable/equatable.dart';

enum ChangePasswordStatus { idle, loading, success, error }

enum FormStatus { valid, unValid }

class ChangePasswordState extends Equatable {
  ChangePasswordStatus changePasswordStatus;
  FormStatus formStatus;
  Object? error;

  ChangePasswordState(
      {this.changePasswordStatus = ChangePasswordStatus.idle,
      this.formStatus = FormStatus.valid,
      this.error});

  @override
  List<Object?> get props => [changePasswordStatus, error, formStatus];

  ChangePasswordState copyWith(
      {ChangePasswordStatus? changePasswordStatus,
      FormStatus? formStatus,
      Object? error}) {
    return ChangePasswordState(
      changePasswordStatus: changePasswordStatus ?? this.changePasswordStatus,
      formStatus: formStatus ?? this.formStatus,
      error: error ?? this.error,
    );
  }
}
