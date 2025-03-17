import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/forget_password_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/forget_password_layout/view_model/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final GlobalKey<FormState> formKey = GlobalKey();

  ForgetPasswordCubit({
    required this.forgetPasswordUseCase,
  }) : super(ForgetPasswordState());

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case OnForgotPasswordButtonClicked():
        _forgotPassword(
          email: intent.email,
        );
        break;
      case ValidateForm():
        _validateForm();
        break;
    }
  }

  void _forgotPassword({
    required String email,
  }) async {
    if (_validateForm()) {
      FocusManager.instance.primaryFocus?.unfocus();
      emit(state.copyWith(forgetPasswordStatus: ForgotPasswordStatus.loading));

      var useCaseResult = await forgetPasswordUseCase.invoke(email);

      switch (useCaseResult) {
        case Success<ForgetPasswordResponseEntity>():
          emit(state.copyWith(
              forgetPasswordStatus: ForgotPasswordStatus.success));
        case Error<ForgetPasswordResponseEntity>():
          emit(state.copyWith(
              forgetPasswordStatus: ForgotPasswordStatus.error,
              error: useCaseResult.error));
      }
    }
  }

  bool _validateForm() {
    if (formKey.currentState!.validate() == false) {
      emit(ForgetPasswordState(
        formStatus: FormStatus.unValid,
      ));
      return false;
    } else {
      emit(state.copyWith(formStatus: FormStatus.valid));
      return true;
    }
  }
}

sealed class ForgetPasswordIntent {}

class OnForgotPasswordButtonClicked extends ForgetPasswordIntent {
  final String email;

  OnForgotPasswordButtonClicked({required this.email});
}

class ValidateForm extends ForgetPasswordIntent {}
