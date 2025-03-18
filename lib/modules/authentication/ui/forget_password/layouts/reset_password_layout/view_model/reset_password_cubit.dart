import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/reset_password_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/reset_password_layout/view_model/reset_password_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final ResetPasswordUseCase resetPasswordUseCase;

  bool isNewPasswordObscure = true, isConfirmPasswordObscure = true;

  ResetPasswordCubit({required this.resetPasswordUseCase})
      : super(const ResetPasswordState());

  void doIntent(ResetPasswordIntent intent) {
    switch (intent) {
      case OnResetPasswordClicked():
        _resetPassword(mail: intent.mail, newPassword: intent.newPassword);
        break;
      case ValidateForm():
        _validateForm();
        break;
      case OnNewPasswordVisibilityClick():
        _onNewPasswordVisibilityClick();
        break;
      case OnConfirmPasswordVisibilityClick():
        _onConfirmPasswordVisibilityClick();
        break;
    }
  }

  void _resetPassword(
      {required String mail, required String newPassword}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_validateForm()) {
      emit(state.copyWith(resetPasswordStatus: ResetPasswordStatus.loading));

      var useCaseResult = await resetPasswordUseCase.invoke(mail, newPassword);
      if (isClosed) return;
      switch (useCaseResult) {
        case Success<ResetPasswordResponseEntity>():
          emit(
              state.copyWith(resetPasswordStatus: ResetPasswordStatus.success));
        case Error<ResetPasswordResponseEntity>():
          emit(state.copyWith(
              resetPasswordStatus: ResetPasswordStatus.error,
              error: useCaseResult.error));
      }
    }
  }

  bool _validateForm() {
    if (formKey.currentState!.validate() == false) {
      emit(const ResetPasswordState(
        formStatus: FormStatus.unValid,
      ));
      return false;
    } else {
      emit(state.copyWith(formStatus: FormStatus.valid));
      return true;
    }
  }

  void _onNewPasswordVisibilityClick() {
    isNewPasswordObscure = !isNewPasswordObscure;
  }

  void _onConfirmPasswordVisibilityClick() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
  }
}

sealed class ResetPasswordIntent {}

class OnResetPasswordClicked extends ResetPasswordIntent {
  final String mail;

  final String newPassword;

  OnResetPasswordClicked({required this.mail, required this.newPassword});
}

class ValidateForm extends ResetPasswordIntent {}

class OnNewPasswordVisibilityClick extends ResetPasswordIntent {}

class OnConfirmPasswordVisibilityClick extends ResetPasswordIntent {}
