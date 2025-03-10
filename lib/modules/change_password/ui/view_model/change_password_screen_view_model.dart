import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/core/constants/form_keys/text_form_fields_keys.dart';
import 'package:exam_app_group2/core/custom_exception/old_password_same_as_new_password.dart';
import 'package:exam_app_group2/dio_service/dio_service.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/request/change_password_request_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/response/change_password_response_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/use_cases/change_password/change_password_use_case.dart';
import 'package:exam_app_group2/modules/change_password/ui/view_model/change_password_intent.dart';
import 'package:exam_app_group2/modules/change_password/ui/view_model/change_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordScreenViewModel extends Cubit<ChangePasswordState> {
  bool isCurrentPasswordObscure = true,
      isNewPasswordObscure = true,
      isConfirmPasswordObscure = true;

  final GlobalKey<FormState> formKey = GlobalKey();
  late Map<String, TextEditingController> _formFieldsEditingControllers;
  late Map<String, FocusNode> _formFieldsEditingFocusNodes;
  String? newToken;

  ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordScreenViewModel(this.changePasswordUseCase)
      : super(ChangePasswordState()) {
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

  void doIntent(ChangePasswordIntent intent) {
    switch (intent) {
      case ValidateForm():
        _validateForm();
        break;
      case OnChangePasswordButtonClick():
        _onChangePasswordButtonClick();
        break;
      case DisposeControllerAndFocusNodes():
        _disposeControllerAndFocusNodes();
        break;
      case OnOneOfThePasswordsVisibilityClick():
        _onOneOfThePasswordsVisibilityClick(intent.passwordFormKey);
        break;
      case ChangePassword():
        _changePassword(intent.requestEntity);
        break;
    }
  }

  Future<void> _changePassword(
      ChangePasswordRequestEntity requestEntity) async {
    emit(state.copyWith(changePasswordStatus: ChangePasswordStatus.loading));
    var useCaseResult = await changePasswordUseCase(requestEntity);
    switch (useCaseResult) {
      case Success<ChangePasswordResponseEntity>():
        newToken = useCaseResult.data.token;
        _updateDioWithToken(newToken ?? "");
        emit(
            state.copyWith(changePasswordStatus: ChangePasswordStatus.success));
      case Error<ChangePasswordResponseEntity>():
        emit(state.copyWith(
            changePasswordStatus: ChangePasswordStatus.error,
            error: useCaseResult.error));
    }
  }

  bool _validateForm() {
    if (formKey.currentState!.validate() == false) {
      emit(ChangePasswordState(formStatus: FormStatus.unValid));
      return false;
    } else {
      emit(state.copyWith(formStatus: FormStatus.valid));
      return true;
    }
  }

  void _onChangePasswordButtonClick() {
    _unFocusKeyboard();
    if (_validateForm()) {
      if (currentPasswordController.text == newPasswordController.text) {
        emit(state.copyWith(
            changePasswordStatus: ChangePasswordStatus.error,
            error: OldPasswordSameAsNewPassword()));
      } else {
        _changePassword(
          ChangePasswordRequestEntity(
            oldPassword: currentPasswordController.text,
            password: newPasswordController.text,
            rePassword: confirmPasswordController.text,
          ),
        );
      }
    }
  }

  void _updateDioWithToken(String newToken) {
    DioService.updateDioWithToken(newToken);
  }

  void _onOneOfThePasswordsVisibilityClick(String passwordFormKey) {
    switch (passwordFormKey) {
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

  void _disposeControllerAndFocusNodes() {
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

  void _unFocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
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
