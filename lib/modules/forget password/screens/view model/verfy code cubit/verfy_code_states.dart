import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/core/api/api_error/api_error_model.dart';

enum VerifyCodeStatus {
  initial,
  loading,
  success,
  error,
}

extension VerifyCodeStatusEx on VerifyCodeState {
  bool get isInitial => status == VerifyCodeStatus.initial;
  bool get isLoading => status == VerifyCodeStatus.loading;
  bool get isSuccess => status == VerifyCodeStatus.success;
  bool get isError => status == VerifyCodeStatus.error;
}

class VerifyCodeState extends Equatable {
  final VerifyCodeStatus status;
  final ApiErrorModel? apiErrorModel;

  const VerifyCodeState({
    this.status = VerifyCodeStatus.initial,
    this.apiErrorModel,
  });

  VerifyCodeState copyWith({
    VerifyCodeStatus? status,
    ApiErrorModel? apiErrorModel,
  }) {
    return VerifyCodeState(
      status: status ?? this.status,
      apiErrorModel: apiErrorModel ?? this.apiErrorModel,
    );
  }

  @override
  List<Object?> get props => [status, apiErrorModel];
}
