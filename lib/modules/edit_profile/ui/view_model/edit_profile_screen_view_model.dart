import 'dart:typed_data';

import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/core/constants/form_keys/text_form_fields_keys.dart';
import 'package:exam_app_group2/core/custom_exception/profile_not_changed_exception.dart';
import 'package:exam_app_group2/image_picking/contracts/image_picking_service_contract.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/request/edit_profile_request_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/response/edit_profile_response_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/use_cases/edit_profile/edit_profile_use_case.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/view_model/edit_profile_intent.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/view_model/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileScreenViewModel extends Cubit<EditProfileState> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final Map<String, TextEditingController> _signUpFieldsControllers;
  late final Map<String, FocusNode> _signUpFieldsFocusNodes;

  bool profileHasChanged = false;
  bool profileUpdatedAtLeastOnce = false, avatarUpdatedAtLeastOnce = false;

  EditProfileUseCase editProfileUseCase;
  ImagePickingService imagePickingService;

  Uint8List? avatarImage;

  EditProfileScreenViewModel(this.editProfileUseCase, this.imagePickingService)
      : super(EditProfileState());

  void doIntent(EditProfileIntent intent) async {
    switch (intent) {
      case InitControllersAndFocusNodes():
        _initControllersAndFocusNodes(authEntity: intent.authEntity);
        break;
      case ValidateForm():
        _validateForm();
        break;
      case OnUpdateButtonClick():
        _onUpdateButtonClick(intent.oldAuthEntity);
        break;
      case DisposeControllersAndFocusNodes():
        _disposeControllersAndFocusNodes();
        break;
      case OnAvatarTap():
        await _onAvatarTap(intent.emailId);
        break;
      case InitAvatarImage():
        _initAvatarImage(intent.image);
        break;
    }
  }

  void _initAvatarImage(Uint8List? newImage) {
    avatarImage = newImage;
  }

  void _editProfile(
      {required EditProfileRequestEntity editProfileRequestEntity,
      required AuthenticationResponseEntity oldAuthEntity}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!profileHasChanged) {
      emit(
        state.copyWith(
          editProfileState: EditStatus.error,
          error: ProfileNotChangeException(),
        ),
      );
    } else {
      emit(state.copyWith(editProfileState: EditStatus.loading));
      var useCaseResult = await editProfileUseCase(editProfileRequestEntity);
      switch (useCaseResult) {
        case Success<EditProfileResponseEntity>():
          profileHasChanged = false;
          if (!profileUpdatedAtLeastOnce) profileUpdatedAtLeastOnce = true;
          print(
              "Email changed ${oldAuthEntity.user!.email != editProfileRequestEntity.email}");
          if (oldAuthEntity.user!.email != editProfileRequestEntity.email) {
            await _whenEmailChanges(
                oldEmailId: oldAuthEntity.user!.email!,
                newEmailId: editProfileRequestEntity.email!);
          }
          emit(state.copyWith(editProfileState: EditStatus.success));
        case Error<EditProfileResponseEntity>():
          emit(state.copyWith(
              editProfileState: EditStatus.error, error: useCaseResult.error));
      }
    }
  }

  bool _validateForm() {
    if (formKey.currentState!.validate() == false) {
      emit(EditProfileState(editFormStatus: EditFormStatus.unValid));
      return false;
    } else {
      emit(state.copyWith(editFormStatus: EditFormStatus.valid));
      return true;
    }
  }

  void _onUpdateButtonClick(AuthenticationResponseEntity oldAuthEntity) {
    if (_validateForm()) {
      final oldUser = oldAuthEntity.user;
      _editProfile(
        editProfileRequestEntity: EditProfileRequestEntity(
          username: _checkEquality(oldUser?.username, userNameController.text),
          firstName:
              _checkEquality(oldUser?.firstName, firstNameController.text),
          lastName: _checkEquality(oldUser?.lastName, lastNameController.text),
          email: _checkEquality(oldUser?.email, emailController.text),
          phone: _checkEquality(oldUser?.phone, phoneNumberController.text),
        ),
        oldAuthEntity: oldAuthEntity,
      );
    }
  }

  Future<void> _whenEmailChanges(
      {required String oldEmailId, required String newEmailId}) {
    return imagePickingService.updateImageEmailId(
        oldEmailId: oldEmailId, newEmailId: newEmailId);
  }

  String? _checkEquality(
      String? oldAuthEntityAttribute, String controllerValue) {
    if (oldAuthEntityAttribute != controllerValue) {
      if (!profileHasChanged) profileHasChanged = true;
      return controllerValue;
    }
    return null;
  }

  void _initControllersAndFocusNodes(
      {required AuthenticationResponseEntity authEntity}) {
    var user = authEntity.user;
    _signUpFieldsControllers = {
      TextFormFieldsKeys.userName: TextEditingController(text: user?.username),
      TextFormFieldsKeys.firstName:
          TextEditingController(text: user?.firstName),
      TextFormFieldsKeys.lastName: TextEditingController(text: user?.lastName),
      TextFormFieldsKeys.email: TextEditingController(text: user?.email),
      TextFormFieldsKeys.password: TextEditingController(text: "******"),
      TextFormFieldsKeys.phoneNumber: TextEditingController(text: user?.phone)
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

  void _disposeControllersAndFocusNodes() {
    _signUpFieldsControllers.forEach(
      (key, controller) => controller.dispose(),
    );
    _signUpFieldsFocusNodes.forEach(
      (key, focusNode) => focusNode.dispose,
    );
  }

  Future<void> _onAvatarTap(String email) async {
    final imageFile = await imagePickingService.pickImageFromGallery();
    if (imageFile != null) {
      await imagePickingService.saveImageLocallyAsBinary(
          imageFile: imageFile, emailId: email);
      final imageBytes = await imageFile.readAsBytes();
      if (!avatarUpdatedAtLeastOnce) avatarUpdatedAtLeastOnce = true;
      _initAvatarImage(imageBytes);
      emit(state.copyWith(avatarImage: imageBytes));
    }
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
