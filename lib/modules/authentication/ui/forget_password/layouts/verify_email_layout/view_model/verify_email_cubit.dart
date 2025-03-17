import 'dart:developer';

import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/forget_password_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/verification_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/verfy_code_usecase.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/view_model/verify_email_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyCodeUseSase verifyCodeUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  VerifyEmailCubit(
      {required this.verifyCodeUseCase, required this.forgetPasswordUseCase})
      : super(const VerifyEmailState());

  void doIntent(VerifyCodeIntent intent) {
    switch (intent) {
      case OnVerifyCodeSubmitted():
        _verifyCode(
          code: intent.code,
        );
        break;
      case OnResendCodeClick():
        _onResendButtonClick(intent.email);
        break;
      case SubmitCode():
        _submitCode(intent.codeDigits);
    }
  }

  void _submitCode(List<String> codeDigits) {
    if (codeDigits.length == 6) {
      log("inside verify intent");

      _verifyCode(code: codeDigits.join());
    }
  }

  void _verifyCode({required String code}) async {
    emit(state.copyWith(emailVerificationStatus: Status.loading));

    var apiResult = await verifyCodeUseCase.invoke(code);

    if (isClosed) return;
    switch (apiResult) {
      case Success<VerificationResponseEntity>():
        emit(state.copyWith(emailVerificationStatus: Status.success));
      case Error<VerificationResponseEntity>():
        emit(state.copyWith(
          emailVerificationStatus: Status.error,
          error: apiResult.error,
        ));
    }
  }

  void _onResendButtonClick(String email) async {
    emit(state.copyWith(resendCodeStatus: Status.loading));

    var useCaseResult = await forgetPasswordUseCase.invoke(email);

    switch (useCaseResult) {
      case Success<ForgetPasswordResponseEntity>():
        emit(state.copyWith(resendCodeStatus: Status.success));
      case Error<ForgetPasswordResponseEntity>():
        emit(state.copyWith(
            resendCodeStatus: Status.error, error: useCaseResult.error));
    }
  }
}

sealed class VerifyCodeIntent {}

class OnVerifyCodeSubmitted extends VerifyCodeIntent {
  final String code;

  OnVerifyCodeSubmitted({required this.code});
}

class SubmitCode extends VerifyCodeIntent {
  final List<String> codeDigits;

  SubmitCode({required this.codeDigits});
}

class OnResendCodeClick extends VerifyCodeIntent {
  String email;

  OnResendCodeClick(this.email);
}
