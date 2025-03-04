import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/constants/emojis/emojis.dart';
import 'package:exam_app_group2/core/constants/form_keys/text_form_fields_keys.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/modules/reset_password/view_model/reset_password_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends BaseStatefulWidgetState<ResetPasswordScreen> {
  late ValidateFunctions validateFunctions;
  ResetPasswordScreenViewModel resetPasswordViewModel =
      getIt.get<ResetPasswordScreenViewModel>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    validateFunctions = ValidateFunctions.getInstance(appLocalizations);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(title: appLocalizations.resetPassword),
        body: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: resetPasswordViewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RPadding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: TextFormField(
                      controller:
                          resetPasswordViewModel.currentPasswordController,
                      validator: (inputText) {
                        return validateFunctions
                            .validationOfPassword(inputText);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:
                          resetPasswordViewModel.isCurrentPasswordObscure,
                      obscuringCharacter: Emojis.star,
                      focusNode:
                          resetPasswordViewModel.currentPasswordFocusNode,
                      onFieldSubmitted: (value) => resetPasswordViewModel
                          .newPasswordFocusNode
                          .requestFocus(),
                      decoration: InputDecoration(
                        labelText: appLocalizations.currentPassword,
                        hintText: appLocalizations.currentPassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              resetPasswordViewModel
                                  .onOneOfThePasswordsVisibilityClick(
                                      TextFormFieldsKeys.currentPassword);
                            });
                          },
                          icon: Icon(
                              resetPasswordViewModel.isCurrentPasswordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: resetPasswordViewModel.newPasswordController,
                    validator: (inputText) {
                      return validateFunctions.validationOfPassword(inputText);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: resetPasswordViewModel.isNewPasswordObscure,
                    obscuringCharacter: Emojis.star,
                    focusNode: resetPasswordViewModel.newPasswordFocusNode,
                    onFieldSubmitted: (value) => resetPasswordViewModel
                        .confirmPasswordFocusNode
                        .requestFocus(),
                    decoration: InputDecoration(
                      labelText: appLocalizations.newPassword,
                      hintText: appLocalizations.newPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            resetPasswordViewModel
                                .onOneOfThePasswordsVisibilityClick(
                                    TextFormFieldsKeys.newPassword);
                          });
                        },
                        icon: Icon(resetPasswordViewModel.isNewPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextFormField(
                    controller:
                        resetPasswordViewModel.confirmPasswordController,
                    validator: (inputText) {
                      return validateFunctions.validationOfConfirmPassword(
                          inputText,
                          resetPasswordViewModel.newPasswordController);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:
                        resetPasswordViewModel.isConfirmPasswordObscure,
                    obscuringCharacter: Emojis.star,
                    focusNode: resetPasswordViewModel.confirmPasswordFocusNode,
                    onFieldSubmitted: (value) => resetPasswordViewModel
                        .confirmPasswordFocusNode
                        .unfocus(),
                    decoration: InputDecoration(
                      labelText: appLocalizations.confirmPassword,
                      hintText: appLocalizations.confirmPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            resetPasswordViewModel
                                .onOneOfThePasswordsVisibilityClick(
                                    TextFormFieldsKeys.confirmPassword);
                          });
                        },
                        icon: Icon(
                            resetPasswordViewModel.isConfirmPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 54.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      appLocalizations.update,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
