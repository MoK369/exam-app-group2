import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/login_use_case.dart';
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
    }
  }

  void _login({
    required LoginRequest loginRequest,
  }) async {
    emit(state.copyWith(
      state: LoginStatus.loading,
    ));
    var result = await loginUseCase.execute(
      loginRequest: loginRequest,
    );
    switch (result) {
      case Success<void>():
        emit(state.copyWith(
          state: LoginStatus.success,
        ));
      case Error<void>():
        emit(
          state.copyWith(
            state: LoginStatus.error,
            apiErrorModel: result.apiErrorModel,
          ),
        );
    }
  }
}

sealed class LoginIntent {}

class OnLoginButtonClicked extends LoginIntent {
  LoginRequest loginRequest;

  OnLoginButtonClicked({
    required this.loginRequest,
  });
}
