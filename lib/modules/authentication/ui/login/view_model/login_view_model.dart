import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/modules/authentication/domain/use_cases/login/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_result/api_result.dart';
import '../../../data/models/login/login_request.dart';
import '../../../domain/entities/authentication/authentication_response_entity.dart';

part 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel({
    required this.loginUseCase,
  }) : super(LoginState());
  LoginUseCase loginUseCase;

  void doIntent(LoginIntent intent) {
    switch (intent) {
      case OnLoginButtonClicked():
        _login(
          loginRequest: intent.loginRequest,
        );
      case DeleteLoginInfo():
        _deleteLoginInfo();
      case ValidateForm():
        _validateForm();
    }
  }

  void _login({
    required LoginRequest loginRequest,
  }) async {
    if (_validateForm()) {
      emit(LoginState(state: LoginStatus.loading));
      var useCaseResult = await loginUseCase.execute(
        loginRequest: loginRequest,
      );
      switch (useCaseResult) {
        case Success<AuthenticationResponseEntity>():
          emit(LoginState(
            state: LoginStatus.success,
            authEntity: useCaseResult.data,
          ));
        case Error<AuthenticationResponseEntity>():
          emit(
            LoginState(
              state: LoginStatus.error,
              error: useCaseResult.error,
            ),
          );
      }
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();

  bool _validateForm() {
    if (formKey.currentState!.validate() == false) {
      emit(
        state.copyWith(
          loginFormStatus: LoginFormStatus.unValid,
        ),
      );
      return false;
    } else {
      emit(
        state.copyWith(
          loginFormStatus: LoginFormStatus.valid,
        ),
      );
      return true;
    }
  }

  void _deleteLoginInfo() async {
    await loginUseCase.deleteUserInfo();
  }
}

sealed class LoginIntent {}

class OnLoginButtonClicked extends LoginIntent {
  LoginRequest loginRequest;

  OnLoginButtonClicked({
    required this.loginRequest,
  });
}

class DeleteLoginInfo extends LoginIntent {}

class ValidateForm extends LoginIntent {}
