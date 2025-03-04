import 'package:exam_app_group2/core/constants/form_keys/text_form_fields_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordScreenViewModel {
  bool isCurrentPasswordObscure = true,
      isNewPasswordObscure = true,
      isConfirmPasswordObscure = true;

  final GlobalKey<FormState> formKey = GlobalKey();
  late Map<String, TextEditingController> _formFieldsEditingControllers;
  late Map<String, FocusNode> _formFieldsEditingFocusNodes;

  ResetPasswordScreenViewModel() {
    _formFieldsEditingControllers = {
      TextFormFieldsKeys.currentPassword: TextEditingController(),
      TextFormFieldsKeys.newPassword: TextEditingController(),
      TextFormFieldsKeys.confirmPassword: TextEditingController(),
    };
    _formFieldsEditingFocusNodes = {
      TextFormFieldsKeys.currentPassword: FocusNode(),
      TextFormFieldsKeys.newPassword: FocusNode(),
      TextFormFieldsKeys.confirmPassword: FocusNode(),
    };
  }

  void onOneOfThePasswordsVisibilityClick(String passwordFromKey) {
    switch (passwordFromKey) {
      case TextFormFieldsKeys.currentPassword:
        isCurrentPasswordObscure = !isCurrentPasswordObscure;
        break;
      case TextFormFieldsKeys.newPassword:
        isNewPasswordObscure = !isNewPasswordObscure;
        break;
      case TextFormFieldsKeys.confirmPassword:
        isConfirmPasswordObscure = !isConfirmPasswordObscure;
        break;
    }
  }

  void disposeControllerAndFocusNodes() {
    _formFieldsEditingControllers.forEach(
      (key, controller) {
        controller.dispose();
      },
    );
    _formFieldsEditingFocusNodes.forEach(
      (key, focusNode) {
        focusNode.dispose();
      },
    );
  }

  TextEditingController get currentPasswordController =>
      _formFieldsEditingControllers[TextFormFieldsKeys.currentPassword]!;

  TextEditingController get newPasswordController =>
      _formFieldsEditingControllers[TextFormFieldsKeys.newPassword]!;

  TextEditingController get confirmPasswordController =>
      _formFieldsEditingControllers[TextFormFieldsKeys.confirmPassword]!;

  FocusNode get currentPasswordFocusNode =>
      _formFieldsEditingFocusNodes[TextFormFieldsKeys.currentPassword]!;

  FocusNode get newPasswordFocusNode =>
      _formFieldsEditingFocusNodes[TextFormFieldsKeys.newPassword]!;

  FocusNode get confirmPasswordFocusNode =>
      _formFieldsEditingFocusNodes[TextFormFieldsKeys.confirmPassword]!;
}
