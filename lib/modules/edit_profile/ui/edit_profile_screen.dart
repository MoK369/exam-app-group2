import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/providers/error/error_notifier.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/core/widgets/profile_form_widget.dart';
import 'package:exam_app_group2/image_picking/contracts/image_picking_service_contract.dart';
import 'package:exam_app_group2/image_picking/permissions/image_picking_permission.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/view_model/edit_profile_intent.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/view_model/edit_profile_screen_view_model.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/view_model/edit_profile_state.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/profile_layout.dart';
import 'package:exam_app_group2/modules/home/UI/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  static const String widgetName = "EditProfileScreen";
  final EditProfileScreenParameters editProfileScreenParameters;

  const EditProfileScreen(
      {super.key, required this.editProfileScreenParameters});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState
    extends BaseStatefulWidgetState<EditProfileScreen> {
  final EditProfileScreenViewModel editProfileViewModel =
      getIt.get<EditProfileScreenViewModel>();

  final ImagePickingService imagePickingService =
      getIt.get<ImagePickingService>();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    editProfileViewModel.doIntent(InitControllersAndFocusNodes(
        authEntity: widget.editProfileScreenParameters.authEntity));
    editProfileViewModel.doIntent(
        InitAvatarImage(image: widget.editProfileScreenParameters.avatarImage));
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    onLeadingButtonClick();
    return true;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await initErrorNotifier(context, EditProfileScreen.widgetName);
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
                onLeadingButtonClick();
              },
            ),
            body: BlocBuilder<EditProfileScreenViewModel, EditProfileState>(
              buildWhen: (previous, current) {
                if ((previous.editFormStatus != current.editFormStatus) ||
                    (previous.avatarImage != current.avatarImage)) {
                  return true;
                }

                return false;
              },
              builder: (context, state) {
                return RPadding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: ProfileFormWidget(
                    avatarState: AvatarState(
                        avatarImage: editProfileViewModel.avatarImage),
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
                    onAvatarTap: () async {
                      var photosPermissionStatus =
                          await ImagePickingPermission.askForPermission();
                      if (!photosPermissionStatus) {
                        getIt.get<ErrorNotifier>().setError(
                            message: appLocalizations.photosPermissionDenied,
                            widgetName: EditProfileScreen.widgetName);
                        return;
                      }
                      print("picking an image-===========");
                      editProfileViewModel.doIntent(
                        OnAvatarTap(
                          emailId: widget.editProfileScreenParameters.authEntity
                                  .user?.email ??
                              "",
                        ),
                      );
                    },
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
                                oldAuthEntity: widget
                                    .editProfileScreenParameters.authEntity));
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
    BackButtonInterceptor.remove(myInterceptor);
    print(editProfileViewModel.profileUpdatedAtLeastOnce);
    editProfileViewModel.doIntent(DisposeControllersAndFocusNodes());
  }

  void onLeadingButtonClick() {
    Navigator.pop<ProfileBackValues>(
      context,
      ProfileBackValues(
          profileUpdatedAtLeastOnce:
              editProfileViewModel.profileUpdatedAtLeastOnce,
          avatarUpdatedAtLeastOnce:
              editProfileViewModel.avatarUpdatedAtLeastOnce),
    );
  }
}

class EditProfileScreenParameters {
  final AuthenticationResponseEntity authEntity;

  final Uint8List? avatarImage;

  EditProfileScreenParameters(
      {required this.authEntity, required this.avatarImage});
}
