import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/core/constants/form_keys/text_form_fields_keys.dart';
import 'package:exam_app_group2/core/extensions/string_extension_methods/title_case_extension_method.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/use_cases/sign_up/sign_up_use_case.dart';
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
      TextFormFieldsKeys.userName: TextEditingController(),
      TextFormFieldsKeys.firstName: TextEditingController(),
      TextFormFieldsKeys.lastName: TextEditingController(),
      TextFormFieldsKeys.email: TextEditingController(),
      TextFormFieldsKeys.password: TextEditingController(),
      TextFormFieldsKeys.confirmPassword: TextEditingController(),
      TextFormFieldsKeys.phoneNumber: TextEditingController()
    };
    _signUpFieldsFocusNodes = {
      TextFormFieldsKeys.userName: FocusNode(),
      TextFormFieldsKeys.firstName: FocusNode(),
      TextFormFieldsKeys.lastName: FocusNode(),
      TextFormFieldsKeys.email: FocusNode(),
      TextFormFieldsKeys.password: FocusNode(),
      TextFormFieldsKeys.confirmPassword: FocusNode(),
      TextFormFieldsKeys.phoneNumber: FocusNode()
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
            signUpError: useCaseResult.error));
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

  bool validateForm() {
    if (formKey.currentState!.validate() == false) {
      emit(const SignUpState(
          signUpStatus: SignUpStatus.initial,
          signUpFormStatus: SignUpFormStatus.unValid));
      return false;
    } else {
      emit(state.copyWith(signUpFormStatus: SignUpFormStatus.valid));
      return true;
    }
  }

  void onSignUpButtonClick() {
    getKeyboardUnfocused();
    if (validateForm()) {
      signUp(
          signUpParameters: SignUpRequestParameters(
        username: _signUpFieldsControllers[TextFormFieldsKeys.userName]?.text,
        firstName: _signUpFieldsControllers[TextFormFieldsKeys.firstName]
            ?.text
            .toTitleCase(),
        lastName: _signUpFieldsControllers[TextFormFieldsKeys.lastName]
            ?.text
            .toTitleCase(),
        email: _signUpFieldsControllers[TextFormFieldsKeys.email]?.text,
        password: _signUpFieldsControllers[TextFormFieldsKeys.password]?.text,
        rePassword:
            _signUpFieldsControllers[TextFormFieldsKeys.confirmPassword]?.text,
        phone: _signUpFieldsControllers[TextFormFieldsKeys.phoneNumber]?.text,
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
      _signUpFieldsControllers[TextFormFieldsKeys.userName]!;
  TextEditingController get firstNameController =>
      _signUpFieldsControllers[TextFormFieldsKeys.firstName]!;
  TextEditingController get lastNameController =>
      _signUpFieldsControllers[TextFormFieldsKeys.lastName]!;
  TextEditingController get emailController =>
      _signUpFieldsControllers[TextFormFieldsKeys.email]!;
  TextEditingController get passwordController =>
      _signUpFieldsControllers[TextFormFieldsKeys.password]!;
  TextEditingController get confirmPasswordController =>
      _signUpFieldsControllers[TextFormFieldsKeys.confirmPassword]!;
  TextEditingController get phoneNumberController =>
      _signUpFieldsControllers[TextFormFieldsKeys.phoneNumber]!;

  // focusNodes getters
  FocusNode get userNameFocusNode =>
      _signUpFieldsFocusNodes[TextFormFieldsKeys.userName]!;
  FocusNode get firstNameFocusNode =>
      _signUpFieldsFocusNodes[TextFormFieldsKeys.firstName]!;
  FocusNode get lastNameFocusNode =>
      _signUpFieldsFocusNodes[TextFormFieldsKeys.lastName]!;
  FocusNode get emailFocusNode =>
      _signUpFieldsFocusNodes[TextFormFieldsKeys.email]!;
  FocusNode get passwordFocusNode =>
      _signUpFieldsFocusNodes[TextFormFieldsKeys.password]!;
  FocusNode get confirmPasswordFocusNode =>
      _signUpFieldsFocusNodes[TextFormFieldsKeys.confirmPassword]!;
  FocusNode get phoneNumberFocusNode =>
      _signUpFieldsFocusNodes[TextFormFieldsKeys.phoneNumber]!;
}
