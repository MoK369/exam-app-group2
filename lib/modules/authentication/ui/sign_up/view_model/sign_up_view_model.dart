import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/core/extensions/string_extension_methods/title_case_extension_method.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/constants/sign_up_fields_names.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/view_model/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final GlobalKey<FormState> formKey = GlobalKey();
  late final Map<String, TextEditingController> _signUpFieldsControllers;
  late final Map<String, FocusNode> _signUpFieldsFocusNodes;
  bool isPasswordObscure = true, isConfirmPasswordObscure = true;

  SignUpViewModel(this._signUpUseCase)
      : super(const SignUpState(signUpStatus: SignUpStatus.initial)) {
    _signUpFieldsControllers = {
      SignUpFieldsKeys.userName: TextEditingController(),
      SignUpFieldsKeys.firstName: TextEditingController(),
      SignUpFieldsKeys.lastName: TextEditingController(),
      SignUpFieldsKeys.email: TextEditingController(),
      SignUpFieldsKeys.password: TextEditingController(),
      SignUpFieldsKeys.confirmPassword: TextEditingController(),
      SignUpFieldsKeys.phoneNumber: TextEditingController()
    };
    _signUpFieldsFocusNodes = {
      SignUpFieldsKeys.userName: FocusNode(),
      SignUpFieldsKeys.firstName: FocusNode(),
      SignUpFieldsKeys.lastName: FocusNode(),
      SignUpFieldsKeys.email: FocusNode(),
      SignUpFieldsKeys.password: FocusNode(),
      SignUpFieldsKeys.confirmPassword: FocusNode(),
      SignUpFieldsKeys.phoneNumber: FocusNode()
    };
  }

  void signUp({required SignUpRequestParameters signUpParameters}) async {
    emit(state.copyWith(signUpStatus: SignUpStatus.loading));
    var useCaseResult =
        await _signUpUseCase.invoke(signUpParameters: signUpParameters);
    switch (useCaseResult) {
      case Success<AuthenticationResponseEntity>():
        emit(state.copyWith(signUpStatus: SignUpStatus.success));
      case Error<AuthenticationResponseEntity>():
        emit(state.copyWith(
            signUpStatus: SignUpStatus.error,
            signUpErrorMessage: useCaseResult.error));
    }
  }

  void onPasswordVisibilityIconClick() {
    isPasswordObscure = !isPasswordObscure;
  }

  void onConfirmPasswordVisibilityIconClick() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
  }

  void getKeyboardUnfocused() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void validateForm() {
    if (formKey.currentState?.validate() == false) {
      emit(const SignUpState(
          signUpStatus: SignUpStatus.initial,
          signUpFormStatus: SignUpFormStatus.unValid));
    } else {
      emit(state.copyWith(signUpFormStatus: SignUpFormStatus.valid));
    }
  }

  void onSignUpButtonClick() {
    getKeyboardUnfocused();
    if (formKey.currentState?.validate() == true) {
      signUp(
          signUpParameters: SignUpRequestParameters(
        username: _signUpFieldsControllers[SignUpFieldsKeys.userName]?.text,
        firstName: _signUpFieldsControllers[SignUpFieldsKeys.firstName]
            ?.text
            .toTitleCase(),
        lastName: _signUpFieldsControllers[SignUpFieldsKeys.lastName]
            ?.text
            .toTitleCase(),
        email: _signUpFieldsControllers[SignUpFieldsKeys.email]?.text,
        password: _signUpFieldsControllers[SignUpFieldsKeys.password]?.text,
        rePassword:
            _signUpFieldsControllers[SignUpFieldsKeys.confirmPassword]?.text,
        phone: _signUpFieldsControllers[SignUpFieldsKeys.phoneNumber]?.text,
      ));
    }
  }

  void disposeControllersAndFocusNodes() {
    _signUpFieldsControllers.forEach(
      (key, controller) => controller.dispose(),
    );
    _signUpFieldsFocusNodes.forEach(
      (key, focusNode) => focusNode.dispose,
    );
  }

  // controllers getters
  TextEditingController get userNameController =>
      _signUpFieldsControllers[SignUpFieldsKeys.userName]!;
  TextEditingController get firstNameController =>
      _signUpFieldsControllers[SignUpFieldsKeys.firstName]!;
  TextEditingController get lastNameController =>
      _signUpFieldsControllers[SignUpFieldsKeys.lastName]!;
  TextEditingController get emailController =>
      _signUpFieldsControllers[SignUpFieldsKeys.email]!;
  TextEditingController get passwordController =>
      _signUpFieldsControllers[SignUpFieldsKeys.password]!;
  TextEditingController get confirmPasswordController =>
      _signUpFieldsControllers[SignUpFieldsKeys.confirmPassword]!;
  TextEditingController get phoneNumberController =>
      _signUpFieldsControllers[SignUpFieldsKeys.phoneNumber]!;

  // focusNodes getters
  FocusNode get userNameFocusNode =>
      _signUpFieldsFocusNodes[SignUpFieldsKeys.userName]!;
  FocusNode get firstNameFocusNode =>
      _signUpFieldsFocusNodes[SignUpFieldsKeys.firstName]!;
  FocusNode get lastNameFocusNode =>
      _signUpFieldsFocusNodes[SignUpFieldsKeys.lastName]!;
  FocusNode get emailFocusNode =>
      _signUpFieldsFocusNodes[SignUpFieldsKeys.email]!;
  FocusNode get passwordFocusNode =>
      _signUpFieldsFocusNodes[SignUpFieldsKeys.password]!;
  FocusNode get confirmPasswordFocusNode =>
      _signUpFieldsFocusNodes[SignUpFieldsKeys.confirmPassword]!;
  FocusNode get phoneNumberFocusNode =>
      _signUpFieldsFocusNodes[SignUpFieldsKeys.phoneNumber]!;
}
