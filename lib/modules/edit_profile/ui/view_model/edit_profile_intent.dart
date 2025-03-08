import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';

sealed class EditProfileIntent {}

class InitControllersAndFocusNodes extends EditProfileIntent {
  AuthenticationResponseEntity authEntity;

  InitControllersAndFocusNodes({required this.authEntity});
}

class ValidateForm extends EditProfileIntent {}

class OnUpdateButtonClick extends EditProfileIntent {
  AuthenticationResponseEntity oldAuthEntity;

  OnUpdateButtonClick({required this.oldAuthEntity});
}

class DisposeControllersAndFocusNodes extends EditProfileIntent {}
