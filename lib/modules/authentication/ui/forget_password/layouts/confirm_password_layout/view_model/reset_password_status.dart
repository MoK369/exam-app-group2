import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/core/api/api_error/api_error_model.dart';

enum ResetPasswordStatus {
  initial,
  loading,
  success,
  error,
}

extension ResetPasswordStatusEx on ResetPasswordState {
  bool get isInitial => status == ResetPasswordStatus.initial;
  bool get isLoading => status == ResetPasswordStatus.loading;
  bool get isSuccess => status == ResetPasswordStatus.success;
  bool get isError => status == ResetPasswordStatus.error;
}

class ResetPasswordState extends Equatable {
  final ResetPasswordStatus status;
  final ApiErrorModel? apiErrorModel;

  const ResetPasswordState({
    this.status = ResetPasswordStatus.initial,
    this.apiErrorModel,
  });

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    ApiErrorModel? apiErrorModel,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      apiErrorModel: apiErrorModel ?? this.apiErrorModel,
    );
  }

  @override
  List<Object?> get props => [status, apiErrorModel];
}
