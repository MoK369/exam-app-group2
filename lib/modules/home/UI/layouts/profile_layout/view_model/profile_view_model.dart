import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/core/constants/form_keys/text_form_fields_keys.dart';
import 'package:exam_app_group2/image_picking/contracts/image_picking_service_contract.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/user/user_entity.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_intent.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_state.dart';
import 'package:exam_app_group2/modules/home/domain/entities/get_logged_user_info/logged_user_info_entity.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/get_logged_user_info/get_logged_user_info_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late Map<String, TextEditingController> _signUpFieldsControllers;

  late UserEntity user;

  GetLoggedUserInfoUseCase _getLoggedUserInfoUseCase;

  ImagePickingService imagePickingService;

  ProfileViewModel(this._getLoggedUserInfoUseCase, this.imagePickingService)
      : super(ProfileState()) {
    _initControllers();
  }

  Future<void> doIntent(ProfileIntent intent) async {
    switch (intent) {
      case GetLoggedUserInfo():
        await _getLoggedUserInfo();
        break;
      case DisposeControllers():
        _disposeControllers();
        break;
    }
  }

  void _initControllers() {
    user = authEntity.user!;
    _signUpFieldsControllers = {
      TextFormFieldsKeys.userName: TextEditingController(text: user.username),
      TextFormFieldsKeys.firstName: TextEditingController(text: user.firstName),
      TextFormFieldsKeys.lastName: TextEditingController(text: user.lastName),
      TextFormFieldsKeys.email: TextEditingController(text: user.email),
      TextFormFieldsKeys.password: TextEditingController(text: "******"),
      TextFormFieldsKeys.phoneNumber: TextEditingController(text: user.phone)
    };
  }

  Future<void> _getLoggedUserInfo() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    var useCaseResult = await _getLoggedUserInfoUseCase();
    switch (useCaseResult) {
      case Success<LoggedUserInfoEntity>():
        authEntity.user = useCaseResult.data.user;
        _initControllers();
        emit(state.copyWith(profileStatus: ProfileStatus.success));
      case Error<LoggedUserInfoEntity>():
        emit(state.copyWith(
            profileStatus: ProfileStatus.error, error: useCaseResult.error));
    }
  }

  void _disposeControllers() {
    _signUpFieldsControllers.forEach(
      (key, controller) => controller.dispose(),
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
}
