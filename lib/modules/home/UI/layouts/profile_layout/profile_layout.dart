import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/core/widgets/profile_form_widget.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/edit_profile_screen.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_intent.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_state.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/view_model/profile_view_model.dart';
import 'package:exam_app_group2/modules/home/UI/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends BaseStatefulWidgetState<ProfileLayout> {
  ProfileViewModel profileViewModel = getIt.get<ProfileViewModel>();
  late HomeViewModel homeViewModel;
  @override
  void initState() {
    super.initState();
    print("In Profile");
    print("${authEntity.token} & ${authEntity.user?.email}");
  }

  @override
  Widget build(BuildContext context) {
    homeViewModel = Provider.of<HomeViewModel>(context);
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
                  avatarState: homeViewModel.avatarState,
                  userNameController: profileViewModel.userNameController,
                  firstNameController: profileViewModel.firstNameController,
                  lastNameController: profileViewModel.lastNameController,
                  emailController: profileViewModel.emailController,
                  passwordController: profileViewModel.passwordController,
                  phoneNumberController: profileViewModel.phoneNumberController,
                  onAvatarTap: () => navigateToEditScreen(),
                  onTextFieldTap: () => navigateToEditScreen(),
                  onChangePasswordClick: () {
                    Navigator.pushNamed<ProfileBackValues>(
                            context, DefinedRoutes.changePasswordRoutName)
                        .then(
                      (profileBackValues) {
                        if (profileBackValues?.newToken != null) {
                          whenThereIsANewTokenBack(
                              profileBackValues!.newToken!);
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
    Navigator.pushNamed<ProfileBackValues>(
            context, DefinedRoutes.editProfileRoutName,
            arguments: EditProfileScreenParameters(
                authEntity: authEntity,
                avatarImage: homeViewModel.avatarState.avatarImage))
        .then(
      (editScreenBackValues) async {
        if (editScreenBackValues?.profileUpdatedAtLeastOnce == true) {
          print("Getting User info========");
          await profileViewModel.doIntent(GetLoggedUserInfo());
        }
        if (editScreenBackValues?.avatarUpdatedAtLeastOnce == true) {
          print("Updating Avatar =========");
          await homeViewModel.getAvatarImage(authEntity.user?.email ?? "");
        }
        if (editScreenBackValues?.newToken != null) {
          whenThereIsANewTokenBack(editScreenBackValues!.newToken!);
        }
      },
    );
  }

  void whenThereIsANewTokenBack(String newToken) {
    print("New Token $newToken");
    authEntity.token = newToken;
  }

  @override
  void dispose() {
    super.dispose();
    profileViewModel.doIntent(DisposeControllers());
  }
}

class ProfileBackValues {
  bool? profileUpdatedAtLeastOnce;
  bool? avatarUpdatedAtLeastOnce;
  String? newToken;

  ProfileBackValues(
      {this.profileUpdatedAtLeastOnce,
      this.avatarUpdatedAtLeastOnce,
      this.newToken});
}
