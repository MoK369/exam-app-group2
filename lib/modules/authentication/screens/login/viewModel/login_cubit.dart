import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/core/utils/result.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/login_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/api_error_model.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  @factoryMethod
  LoginCubit({required this.loginUseCase}) : super(LoginState());
  LoginUseCase loginUseCase;

  void doIntent(LoginIntent intent) {
    switch (intent) {
      case OnLoginButtonClicked():
        _login(
          email: intent.email,
          password: intent.password,
        );
    }
  }

  void _login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(
      state: LoginStatus.loading,
    ));
    var result = await loginUseCase.execute(
      email: email,
      password: password,
    );
    switch (result) {
      case Success<void>():
        emit(state.copyWith(
          state: LoginStatus.success,
        ));
      case Error<void>():
        emit(state.copyWith(
          state: LoginStatus.error,
          apiErrorModel: result.apiErrorModel,
        ));
    }
  }
}

sealed class LoginIntent {}

class OnLoginButtonClicked extends LoginIntent {
  String email;
  String password;

  OnLoginButtonClicked({
    required this.password,
    required this.email,
  });
}
