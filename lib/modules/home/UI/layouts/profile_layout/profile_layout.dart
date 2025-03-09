import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/core/widgets/profile_form_widget.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_intent.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_state.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => profileViewModel,
      child: Scaffold(
        appBar: CustomAppBar(
          title: appLocalizations.profile,
          showLeadingIcon: false,
        ),
        body: BlocBuilder<ProfileViewModel, ProfileState>(
          builder: (context, state) {
            switch (state.profileStatus) {
              case ProfileStatus.loading:
                return const LoadingStateWidget();
              case ProfileStatus.idle:
              case ProfileStatus.success:
                return ProfileFormWidget(
                  userNameController: profileViewModel.userNameController,
                  firstNameController: profileViewModel.firstNameController,
                  lastNameController: profileViewModel.lastNameController,
                  emailController: profileViewModel.emailController,
                  passwordController: profileViewModel.passwordController,
                  phoneNumberController: profileViewModel.phoneNumberController,
                  onAvatarTap: () => navigateToEditScreen(),
                  onTextFieldTap: () => navigateToEditScreen(),
                  onChangePasswordClick: () {
                    Navigator.pushNamed<String>(
                            context, DefinedRoutes.resetPasswordRoutName)
                        .then(
                      (newToken) {
                        if (newToken != null) {
                          print("New Token $newToken");
                          authEntity.token = newToken;
                        }
                      },
                    );
                  },
                );
              case ProfileStatus.error:
                return ErrorStateWidget(error: state.error!);
            }
          },
        ),
      ),
    );
  }

  void navigateToEditScreen() async {
    Navigator.pushNamed<bool>(context, DefinedRoutes.editProfileRoutName,
            arguments: authEntity)
        .then(
      (result) {
        if (result == true) {
          print("Getting User info========");
          profileViewModel.doIntent(GetLoggedUserInfo());
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    profileViewModel.doIntent(DisposeControllers());
  }
}
