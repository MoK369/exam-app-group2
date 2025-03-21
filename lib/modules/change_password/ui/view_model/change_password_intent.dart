import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/request/change_password_request_entity.dart';

sealed class ChangePasswordIntent {}

class ValidateForm extends ChangePasswordIntent {}

class OnChangePasswordButtonClick extends ChangePasswordIntent {}

class DisposeControllerAndFocusNodes extends ChangePasswordIntent {}

class OnOneOfThePasswordsVisibilityClick extends ChangePasswordIntent {
  String passwordFormKey;

  OnOneOfThePasswordsVisibilityClick({required this.passwordFormKey});
}

class ChangePassword extends ChangePasswordIntent {
  ChangePasswordRequestEntity requestEntity;

  ChangePassword({required this.requestEntity});
}
