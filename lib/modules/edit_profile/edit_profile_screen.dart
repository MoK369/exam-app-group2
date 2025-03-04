import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/profile_form_widget.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/view_model/edit_profile_screen_view_model.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final AuthenticationResponseEntity authEntity;

  const EditProfileScreen({super.key, required this.authEntity});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState
    extends BaseStatefulWidgetState<EditProfileScreen> {
  final EditProfileScreenViewModel editProfileViewModel =
      getIt.get<EditProfileScreenViewModel>();

  @override
  void initState() {
    super.initState();
    editProfileViewModel.initControllersAndFocusNodes(
        authEntity: widget.authEntity);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(title: appLocalizations.editProfile),
        body: ProfileFormWidget(
          userNameController: editProfileViewModel.userNameController,
          firstNameController: editProfileViewModel.firstNameController,
          lastNameController: editProfileViewModel.lastNameController,
          emailController: editProfileViewModel.emailController,
          passwordController: editProfileViewModel.passwordController,
          phoneNumberController: editProfileViewModel.phoneNumberController,
          userNameFocusNode: editProfileViewModel.userNameFocusNode,
          firstNameFocusNode: editProfileViewModel.firstNameFocusNode,
          lastNameFocusNode: editProfileViewModel.lastNameFocusNode,
          emailFocusNode: editProfileViewModel.emailFocusNode,
          passwordFocusNode: editProfileViewModel.passwordFocusNode,
          phoneNumberFocusNode: editProfileViewModel.phoneNumberFocusNode,
          areTextFieldsReadOnly: false,
          onChangePasswordClick: () => Navigator.pushReplacementNamed(
              context, DefinedRoutes.resetPasswordRoutName),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    editProfileViewModel.disposeControllersAndFocusNodes();
  }
}
