import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/constants/emojis/emojis.dart';
import 'package:exam_app_group2/core/constants/form_keys/text_form_fields_keys.dart';
import 'package:exam_app_group2/core/custom_exception/old_password_same_as_new_password.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/modules/change_password/ui/view_model/change_password_intent.dart';
import 'package:exam_app_group2/modules/change_password/ui/view_model/change_password_screen_view_model.dart';
import 'package:exam_app_group2/modules/change_password/ui/view_model/change_password_state.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/profile_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String widgetName = "ChangePasswordScreen";
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends BaseStatefulWidgetState<ChangePasswordScreen> {
  late ValidateFunctions validateFunctions;
  ChangePasswordScreenViewModel changePasswordViewModel =
      getIt.get<ChangePasswordScreenViewModel>();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    onLeadingButtonClick();
    return true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initErrorNotifier(context, ChangePasswordScreen.widgetName);
    validateFunctions = ValidateFunctions.getInstance(appLocalizations);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => changePasswordViewModel,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocListener<ChangePasswordScreenViewModel, ChangePasswordState>(
          listener: (context, state) {
            switch (state.changePasswordStatus) {
              case ChangePasswordStatus.idle:
                return;
              case ChangePasswordStatus.loading:
                displayAlertDialog(title: const LoadingStateWidget());
              case ChangePasswordStatus.success:
                hideAlertDialog();
                displayAlertDialog(
                    title: Text(
                      appLocalizations.changedPasswordSuccessfully,
                      textAlign: TextAlign.center,
                    ),
                    showOkButton: true);
              case ChangePasswordStatus.error:
                if (state.error is! OldPasswordSameAsNewPassword) {
                  hideAlertDialog();
                }
                displayAlertDialog(
                    title: ErrorStateWidget(error: state.error!),
                    showOkButton: true);
            }
          },
          child: Scaffold(
            appBar: CustomAppBar(
              title: appLocalizations.resetPassword,
              onLeadingIconButtonClick: () {
                onLeadingButtonClick();
              },
            ),
            body:
                BlocBuilder<ChangePasswordScreenViewModel, ChangePasswordState>(
              buildWhen: (previous, current) {
                print(previous.formStatus != current.formStatus);
                if (previous.formStatus != current.formStatus) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return RPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: changePasswordViewModel.formKey,
                    onChanged: () =>
                        changePasswordViewModel.doIntent(ValidateForm()),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RPadding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: TextFormField(
                              controller: changePasswordViewModel
                                  .currentPasswordController,
                              validator: (inputText) {
                                return validateFunctions
                                    .validationOfPassword(inputText);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: changePasswordViewModel
                                  .isCurrentPasswordObscure,
                              obscuringCharacter: Emojis.star,
                              focusNode: changePasswordViewModel
                                  .currentPasswordFocusNode,
                              onFieldSubmitted: (value) =>
                                  changePasswordViewModel.newPasswordFocusNode
                                      .requestFocus(),
                              decoration: InputDecoration(
                                labelText: appLocalizations.currentPassword,
                                hintText: appLocalizations.currentPassword,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      changePasswordViewModel.doIntent(
                                          OnOneOfThePasswordsVisibilityClick(
                                              passwordFormKey:
                                                  TextFormFieldsKeys
                                                      .currentPassword));
                                    });
                                  },
                                  icon: Icon(changePasswordViewModel
                                          .isCurrentPasswordObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller:
                                changePasswordViewModel.newPasswordController,
                            validator: (inputText) {
                              return validateFunctions
                                  .validationOfPassword(inputText);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                                changePasswordViewModel.isNewPasswordObscure,
                            obscuringCharacter: Emojis.star,
                            focusNode:
                                changePasswordViewModel.newPasswordFocusNode,
                            onFieldSubmitted: (value) => changePasswordViewModel
                                .confirmPasswordFocusNode
                                .requestFocus(),
                            decoration: InputDecoration(
                              labelText: appLocalizations.newPassword,
                              hintText: appLocalizations.newPassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    changePasswordViewModel.doIntent(
                                        OnOneOfThePasswordsVisibilityClick(
                                            passwordFormKey: TextFormFieldsKeys
                                                .newPassword));
                                  });
                                },
                                icon: Icon(
                                    changePasswordViewModel.isNewPasswordObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          TextFormField(
                            controller: changePasswordViewModel
                                .confirmPasswordController,
                            validator: (inputText) {
                              return validateFunctions
                                  .validationOfConfirmPassword(
                                      inputText,
                                      changePasswordViewModel
                                          .newPasswordController);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: changePasswordViewModel
                                .isConfirmPasswordObscure,
                            obscuringCharacter: Emojis.star,
                            focusNode: changePasswordViewModel
                                .confirmPasswordFocusNode,
                            onFieldSubmitted: (value) => changePasswordViewModel
                                .confirmPasswordFocusNode
                                .unfocus(),
                            decoration: InputDecoration(
                              labelText: appLocalizations.confirmPassword,
                              hintText: appLocalizations.confirmPassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    changePasswordViewModel.doIntent(
                                        OnOneOfThePasswordsVisibilityClick(
                                            passwordFormKey: TextFormFieldsKeys
                                                .confirmPassword));
                                  });
                                },
                                icon: Icon(changePasswordViewModel
                                        .isConfirmPasswordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 54.h,
                          ),
                          ElevatedButton(
                            onPressed: state.formStatus == FormStatus.unValid
                                ? null
                                : () {
                                    changePasswordViewModel.doIntent(
                                        OnChangePasswordButtonClick());
                                  },
                            child: Text(
                              appLocalizations.update,
                            ),
                          ),
                        ],
                      ),
                    ),
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
  }

  void onLeadingButtonClick() {
    Navigator.pop<ProfileBackValues>(
      context,
      ProfileBackValues(newToken: changePasswordViewModel.newToken),
    );
  }
}
