import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/profile_form_widget.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends BaseStatefulWidgetState<ProfileLayout> {
  ProfileViewModel profileViewModel = getIt.get<ProfileViewModel>();
  @override
  void initState() {
    super.initState();
    print("In Profile");
    print("${authEntity.token} & ${authEntity.user?.email}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.profile,
        showLeadingIcon: false,
      ),
      body: ProfileFormWidget(
        userNameController: profileViewModel.userNameController,
        firstNameController: profileViewModel.firstNameController,
        lastNameController: profileViewModel.lastNameController,
        emailController: profileViewModel.emailController,
        passwordController: profileViewModel.passwordController,
        phoneNumberController: profileViewModel.phoneNumberController,
        onAvatarTap: () => navigateToEditScreen(),
        onTextFieldTap: () => navigateToEditScreen(),
        onChangePasswordClick: () =>
            Navigator.pushNamed(context, DefinedRoutes.resetPasswordRoutName),
      ),
    );
  }

  void navigateToEditScreen() {
    Navigator.pushNamed(context, DefinedRoutes.editProfileRoutName,
        arguments: authEntity);
  }

  @override
  void dispose() {
    super.dispose();
    profileViewModel.disposeControllersAndFocusNodes();
  }
}
