import 'package:bloc/bloc.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';

import 'package:exam_app_group2/modules/forget%20password/domain/usecases/forget_password_usecase.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/view%20model/forget_password_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgetPasswordUsecase forgotPasswordUseCase;

  ForgotPasswordCubit({
    required this.forgotPasswordUseCase,
  }) : super(const ForgotPasswordState());

  void doIntent(ForgotPasswordIntent intent) {
    switch (intent) {
      case OnForgotPasswordButtonClicked():
        _forgotPassword(
          email: intent.email,
        );
    }
  }

  void _forgotPassword({
    required String email,
  }) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    var result = await forgotPasswordUseCase.invoke(email);

    switch (result) {
      case Success<void>():
        emit(state.copyWith(status: ForgotPasswordStatus.success));
      case Error<void>():
        emit(state.copyWith(
          status: ForgotPasswordStatus.error,
         
        ));
    }
  }
}

sealed class ForgotPasswordIntent {}

class OnForgotPasswordButtonClicked extends ForgotPasswordIntent {
  final String email;

  OnForgotPasswordButtonClicked({required this.email});
}
