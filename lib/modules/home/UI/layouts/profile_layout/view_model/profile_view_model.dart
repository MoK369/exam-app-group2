import 'package:exam_app_group2/core/constants/form_keys/text_form_fields_keys.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final Map<String, TextEditingController> _signUpFieldsControllers;
  late final Map<String, FocusNode> _signUpFieldsFocusNodes;
  late UserEntity user;

  ProfileViewModel() {
    user = authEntity.user!;
    _signUpFieldsControllers = {
      TextFormFieldsKeys.userName: TextEditingController(text: user.username),
      TextFormFieldsKeys.firstName: TextEditingController(text: user.firstName),
      TextFormFieldsKeys.lastName: TextEditingController(text: user.lastName),
      TextFormFieldsKeys.email: TextEditingController(text: user.email),
      TextFormFieldsKeys.password: TextEditingController(text: "******"),
      TextFormFieldsKeys.phoneNumber: TextEditingController(text: user.phone)
    };
    _signUpFieldsFocusNodes = {
      TextFormFieldsKeys.userName: FocusNode(),
      TextFormFieldsKeys.firstName: FocusNode(),
      TextFormFieldsKeys.lastName: FocusNode(),
      TextFormFieldsKeys.email: FocusNode(),
      TextFormFieldsKeys.password: FocusNode(),
      TextFormFieldsKeys.phoneNumber: FocusNode()
    };
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
