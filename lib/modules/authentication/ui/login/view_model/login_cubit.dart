import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api/api_error/api_error_model.dart';
import '../../../../../core/api/api_result/api_result.dart';
import '../../../data/model/login/login_request.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
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
    }
  }

  void _login({
    required LoginRequest loginRequest,
  }) async {
    emit(LoginState(state: LoginStatus.loading));
    var useCaseResult = await loginUseCase.execute(
      loginRequest: loginRequest,
    );
    switch (useCaseResult) {
      case Success<AuthenticationResponseEntity>():
        emit(LoginState(
            state: LoginStatus.success, authEntity: useCaseResult.data));
      case Error<AuthenticationResponseEntity>():
        emit(LoginState(
            state: LoginStatus.error,
            apiErrorModel: useCaseResult.apiErrorModel));
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
