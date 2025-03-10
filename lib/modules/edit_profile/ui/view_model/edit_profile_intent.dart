import 'dart:typed_data';

import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';

sealed class EditProfileIntent {}

class InitControllersAndFocusNodes extends EditProfileIntent {
  AuthenticationResponseEntity authEntity;

  InitControllersAndFocusNodes({required this.authEntity});
}

class ValidateForm extends EditProfileIntent {}

class InitAvatarImage extends EditProfileIntent {
  Uint8List? image;

  InitAvatarImage({required this.image});
}

class OnAvatarTap extends EditProfileIntent {
  String emailId;

  OnAvatarTap({required this.emailId});
}

class OnUpdateButtonClick extends EditProfileIntent {
  AuthenticationResponseEntity oldAuthEntity;

  OnUpdateButtonClick({required this.oldAuthEntity});
}

class DisposeControllersAndFocusNodes extends EditProfileIntent {}
