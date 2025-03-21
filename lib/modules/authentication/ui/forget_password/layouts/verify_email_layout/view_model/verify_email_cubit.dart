import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/api_error/api_error_model.dart';
import 'package:exam_app_group2/core/api/api_error_messages/api_error_messages.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/forget_password_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/verification_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:exam_app_group2/modules/authentication/domain/usecases/verfy_code_usecase.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/view_model/verify_email_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;
  final VerifyCodeUseSase verifyCodeUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ValueNotifier<int> timeRemaining = ValueNotifier(1);
  Timer? _timer;

  VerifyEmailCubit(
      {required this.verifyCodeUseCase, required this.forgetPasswordUseCase})
      : super(const VerifyEmailState()) {
    controllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  void doIntent(VerifyEmailIntent intent) {
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
        _submitCode();
        break;
      case StartTimer():
        _startTimer(numberOfSeconds: intent.numberOfSeconds);
        break;
      case DisposeTimerAndValueNotifier():
        _disposeTimerAndValueNotifier();
        break;
      case DisposeControllersAndFocusNodes():
        _disposeControllersAndFocusNodes();
        break;
    }
  }

  void _submitCode() {
    var codeDigits = controllers
        .map(
          (cont) {
            return cont.text;
          },
        )
        .toList()
        .join();
    if (codeDigits.length == 6) {
      _verifyCode(code: codeDigits);
    }
  }

  void _verifyCode({required String code}) async {
    emit(const VerifyEmailState(emailVerificationStatus: Status.loading));

    var useCaseResult = await verifyCodeUseCase.invoke(code);

    if (isClosed) return;
    switch (useCaseResult) {
      case Success<VerificationResponseEntity>():
        emit(state.copyWith(emailVerificationStatus: Status.success));
      case Error<VerificationResponseEntity>():
        emit(state.copyWith(
          emailVerificationStatus: Status.error,
          isSendCodeInvalid: _checkInvalidCodeError(useCaseResult.error),
          error: useCaseResult.error,
        ));
        // if (_checkInvalidCodeError(useCaseResult.error)) {
        //   formKey.currentState!.validate();
        // }
        _emptyControllersValues();
    }
  }

  void _onResendButtonClick(String email) async {
    emit(const VerifyEmailState(resendCodeStatus: Status.loading));

    var useCaseResult = await forgetPasswordUseCase.invoke(email);

    switch (useCaseResult) {
      case Success<ForgetPasswordResponseEntity>():
        emit(state.copyWith(resendCodeStatus: Status.success));
      case Error<ForgetPasswordResponseEntity>():
        emit(state.copyWith(
            resendCodeStatus: Status.error, error: useCaseResult.error));
    }
  }

  bool _checkInvalidCodeError(Object error) {
    if (error is DioException) {
      var apiErrorModel = ApiErrorModel.fromJson(error.response?.data);
      return apiErrorModel.message
              ?.contains(ApiErrorMessages.invalidCodeErrorMessage) ??
          false;
    }
    return false;
  }

  void _emptyControllersValues() {
    for (var cont in controllers) {
      cont.clear();
    }
  }

  void _startTimer({required int numberOfSeconds}) {
    timeRemaining.value = numberOfSeconds;
    if (_timer?.isActive == true) {
      return;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeRemaining.value > 0) {
        timeRemaining.value -= 1;
      } else {
        _timer?.cancel();
      }
    });
  }

  void _disposeTimerAndValueNotifier() {
    _timer?.cancel();
    timeRemaining.dispose();
  }

  void _disposeControllersAndFocusNodes() {
    for (var cont in controllers) {
      cont.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
  }
}

sealed class VerifyEmailIntent {}

class OnVerifyCodeSubmitted extends VerifyEmailIntent {
  final String code;

  OnVerifyCodeSubmitted({required this.code});
}

class SubmitCode extends VerifyEmailIntent {}

class DisposeControllersAndFocusNodes extends VerifyEmailIntent {}

class OnResendCodeClick extends VerifyEmailIntent {
  String email;

  OnResendCodeClick(this.email);
}

class DisposeTimerAndValueNotifier extends VerifyEmailIntent {
  DisposeTimerAndValueNotifier();
}

class StartTimer extends VerifyEmailIntent {
  int numberOfSeconds;

  StartTimer(this.numberOfSeconds);
}
