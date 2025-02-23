part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

extension LoginStatusEx on LoginState {
  bool get isInitial => state == LoginStatus.initial;

  bool get isLoading => state == LoginStatus.loading;

  bool get isSuccess => state == LoginStatus.success;

  bool get isError => state == LoginStatus.error;
}

class LoginState extends Equatable {
  LoginStatus state;
  AuthenticationResponseEntity? authEntity;
  final ApiErrorModel? apiErrorModel;

  LoginState({
    this.state = LoginStatus.initial,
    this.authEntity,
    this.apiErrorModel,
  });

  // No Need for copyWith function <=====
  // LoginState copyWith({
  //   LoginStatus? state,
  //   ApiErrorModel? apiErrorModel,
  // }) {
  //   return LoginState(
  //     state: state ?? this.state,
  //     apiErrorModel: apiErrorModel ?? this.apiErrorModel,
  //   );
  // }

  @override
  List<Object?> get props => [
        state,
        apiErrorModel,
      ];
}
