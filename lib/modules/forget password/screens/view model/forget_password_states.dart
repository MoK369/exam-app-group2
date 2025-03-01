
import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/core/api/api_error/api_error_model.dart';

// part of 'forget_password_cubit.dart' ;

enum ForgotPasswordStatus {
  initial,
  loading,
  success,
  error,
}


extension ForgotPasswordStatusEx on ForgotPasswordState {
  bool get isInitial => status == ForgotPasswordStatus.initial;
  bool get isLoading => status == ForgotPasswordStatus.loading;
  bool get isSuccess => status == ForgotPasswordStatus.success;
  bool get isError => status == ForgotPasswordStatus.error;
}



class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;
  final ApiErrorModel? apiErrorModel;

  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.initial,
    this.apiErrorModel,
  });

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    ApiErrorModel? apiErrorModel,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      apiErrorModel: apiErrorModel ?? this.apiErrorModel,
    );
  }

  @override
  List<Object?> get props => [status, apiErrorModel];
}
