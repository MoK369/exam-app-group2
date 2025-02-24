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

enum LoginFormStatus { valid, unValid }

extension LoginFormStatusEx on LoginState {
  bool get isValid => state == LoginStatus.initial;

  bool get isUnValid => state == LoginStatus.loading;
}

class LoginState extends Equatable {
  LoginStatus state;
  LoginFormStatus loginFormStatus;
  AuthenticationResponseEntity? authEntity;
  final Object? error;

  LoginState({
    this.state = LoginStatus.initial,
    this.authEntity,
    this.loginFormStatus = LoginFormStatus.valid,
    this.error,
  });

  LoginState copyWith({
    LoginStatus? state,
    LoginFormStatus? loginFormStatus,
    Error? error,
  }) {
    return LoginState(
      state: state ?? this.state,
      error: error ?? this.error,
      loginFormStatus: loginFormStatus ?? this.loginFormStatus,
    );
  }

  @override
  List<Object?> get props => [
        state,
        error,
        loginFormStatus,
      ];
}
