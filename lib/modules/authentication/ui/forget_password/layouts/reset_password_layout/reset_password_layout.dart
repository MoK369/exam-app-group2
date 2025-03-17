import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/constants/emojis/emojis.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_button.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/reset_password_layout/view_model/reset_password_cubit.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/reset_password_layout/view_model/reset_password_status.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/view_model/forget_password_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResetPasswordLayout extends StatefulWidget {
  const ResetPasswordLayout({super.key});

  @override
  State<ResetPasswordLayout> createState() => _ResetPasswordLayoutState();
}

class _ResetPasswordLayoutState
    extends BaseStatefulWidgetState<ResetPasswordLayout> {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final FocusNode newPasswordFocusNode = FocusNode(),
      confirmPasswordFocusNode = FocusNode();

  ResetPasswordCubit resetPasswordCubit = getIt<ResetPasswordCubit>();

  late ForgetPasswordScreenViewModel forgetPasswordScreenViewModel;

  late ValidateFunctions validateFunctions;
  String? currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentLocale ??= localizationUseCase.currentLocale;
    validateFunctions = ValidateFunctions.getInstance(appLocalizations);
    if (resetPasswordCubit.state.formStatus == FormStatus.unValid &&
        (currentLocale != localizationUseCase.currentLocale)) {
      resetPasswordCubit.doIntent(ValidateForm());
      currentLocale = localizationUseCase.currentLocale;
    }
    forgetPasswordScreenViewModel =
        Provider.of<ForgetPasswordScreenViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => resetPasswordCubit,
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          switch (state.resetPasswordStatus) {
            case ResetPasswordStatus.initial:
              break;
            case ResetPasswordStatus.loading:
              displayAlertDialog(title: const LoadingStateWidget());
            case ResetPasswordStatus.success:
              hideAlertDialog();
              displayAlertDialog(
                  title: Text(
                    appLocalizations.resetPasswordSuccessfully,
                    textAlign: TextAlign.center,
                  ),
                  showOkButton: true);
            case ResetPasswordStatus.error:
              hideAlertDialog();
              displayAlertDialog(title: ErrorStateWidget(error: state.error!));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: resetPasswordCubit.formKey,
              onChanged: () => resetPasswordCubit.doIntent(ValidateForm()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Text(
                      appLocalizations.resetPassword,
                      style: AppThemes.styles18w500black15,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Center(
                    child: Text(
                      appLocalizations.resetPasswordGuidance,
                      style: AppThemes.styles14w400grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextFormField(
                    controller: newPassword,
                    focusNode: newPasswordFocusNode,
                    validator: (inputText) {
                      return validateFunctions.validationOfPassword(inputText);
                    },
                    onFieldSubmitted: (value) =>
                        confirmPasswordFocusNode.requestFocus(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: resetPasswordCubit.isNewPasswordObscure,
                    obscuringCharacter: Emojis.star,
                    decoration: InputDecoration(
                        labelText: appLocalizations.newPassword,
                        hintText: appLocalizations.enterPassword,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                resetPasswordCubit
                                    .doIntent(OnNewPasswordVisibilityClick());
                              });
                            },
                            icon: Icon(resetPasswordCubit.isNewPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility))),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    controller: confirmPassword,
                    focusNode: confirmPasswordFocusNode,
                    validator: (inputText) {
                      return validateFunctions.validationOfConfirmPassword(
                          inputText, newPassword);
                    },
                    onFieldSubmitted: (value) =>
                        confirmPasswordFocusNode.unfocus(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: resetPasswordCubit.isConfirmPasswordObscure,
                    obscuringCharacter: Emojis.star,
                    decoration: InputDecoration(
                      labelText: appLocalizations.confirmPassword,
                      hintText: appLocalizations.confirmPassword,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              resetPasswordCubit
                                  .doIntent(OnConfirmPasswordVisibilityClick());
                            });
                          },
                          icon: Icon(resetPasswordCubit.isConfirmPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    buildWhen: (previous, current) {
                      if (previous.formStatus != current.formStatus) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        onTap: state.formStatus == FormStatus.unValid
                            ? null
                            : () {
                                resetPasswordCubit.doIntent(
                                    OnResetPasswordClicked(
                                        mail:
                                            forgetPasswordScreenViewModel.email,
                                        newPassword: newPassword.text));
                              },
                        text: appLocalizations.continueWord,
                      );
                    },
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
