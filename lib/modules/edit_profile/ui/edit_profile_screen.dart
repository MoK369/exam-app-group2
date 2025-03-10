import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/core/widgets/profile_form_widget.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/view_model/edit_profile_intent.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/view_model/edit_profile_screen_view_model.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/view_model/edit_profile_state.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/profile_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
    editProfileViewModel
        .doIntent(InitControllersAndFocusNodes(authEntity: widget.authEntity));
  }

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      image.readAsBytes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => editProfileViewModel,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocListener<EditProfileScreenViewModel, EditProfileState>(
          listener: (context, state) {
            switch (state.editProfileState) {
              case EditStatus.idle:
                return;
              case EditStatus.loading:
                displayAlertDialog(title: const LoadingStateWidget());
              case EditStatus.success:
                hideAlertDialog();
                displayAlertDialog(
                    title: Text(
                      appLocalizations.editedProfileSuccessfully,
                      textAlign: TextAlign.center,
                    ),
                    showOkButton: true);
              case EditStatus.error:
                if (editProfileViewModel.profileHasChanged) hideAlertDialog();
                displayAlertDialog(
                    title: ErrorStateWidget(error: state.error!),
                    showOkButton: true);
            }
          },
          child: Scaffold(
            appBar: CustomAppBar(
              title: appLocalizations.editProfile,
              onLeadingIconButtonClick: () {
                Navigator.pop<ProfileBackValues>(
                    context,
                    ProfileBackValues(
                        profileUpdatedAtLeastOnce:
                            editProfileViewModel.profileUpdatedAtLeastOnce));
              },
            ),
            body: BlocBuilder<EditProfileScreenViewModel, EditProfileState>(
              buildWhen: (previous, current) {
                if (previous.editFormStatus != current.editFormStatus) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return RPadding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: ProfileFormWidget(
                    formKey: editProfileViewModel.formKey,
                    userNameController: editProfileViewModel.userNameController,
                    firstNameController:
                        editProfileViewModel.firstNameController,
                    lastNameController: editProfileViewModel.lastNameController,
                    emailController: editProfileViewModel.emailController,
                    passwordController: editProfileViewModel.passwordController,
                    phoneNumberController:
                        editProfileViewModel.phoneNumberController,
                    userNameFocusNode: editProfileViewModel.userNameFocusNode,
                    firstNameFocusNode: editProfileViewModel.firstNameFocusNode,
                    lastNameFocusNode: editProfileViewModel.lastNameFocusNode,
                    emailFocusNode: editProfileViewModel.emailFocusNode,
                    passwordFocusNode: editProfileViewModel.passwordFocusNode,
                    phoneNumberFocusNode:
                        editProfileViewModel.phoneNumberFocusNode,
                    areTextFieldsReadOnly: false,
                    onChangePasswordClick: () {
                      Navigator.pushNamed<ProfileBackValues>(
                        context,
                        DefinedRoutes.changePasswordRoutName,
                      ).then((profileBackValues) {
                        print(
                            "ProfileBackValues: ${profileBackValues != null}");
                        if (profileBackValues != null) {
                          Navigator.pop<ProfileBackValues>(
                              context, profileBackValues);
                        }
                      });
                    },
                    onFormChanged: () =>
                        editProfileViewModel.doIntent(ValidateForm()),
                    onUpdateButtonClick: state.editFormStatus ==
                            EditFormStatus.unValid
                        ? null
                        : () {
                            editProfileViewModel.doIntent(OnUpdateButtonClick(
                                oldAuthEntity: widget.authEntity));
                          },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print(editProfileViewModel.profileUpdatedAtLeastOnce);
    editProfileViewModel.doIntent(DisposeControllersAndFocusNodes());
  }
}
