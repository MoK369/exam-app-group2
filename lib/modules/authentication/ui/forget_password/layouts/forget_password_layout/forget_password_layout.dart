import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/custom_button.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/forget_password_screen.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/forget_password_layout/view_model/forget_password_cubit.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/forget_password_layout/view_model/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordLayout extends StatefulWidget {
  final TextEditingController emailController;

  const ForgetPasswordLayout({super.key, required this.emailController});

  @override
  State<ForgetPasswordLayout> createState() => _ForgetPasswordLayoutState();
}

class _ForgetPasswordLayoutState
    extends BaseStatefulWidgetState<ForgetPasswordLayout> {
  ForgetPasswordCubit forgetPasswordCubit = getIt<ForgetPasswordCubit>();
  late ValidateFunctions validateFunctions;

  String? currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentLocale ??= localizationUseCase.currentLocale;
    validateFunctions = ValidateFunctions.getInstance(appLocalizations);
    if (forgetPasswordCubit.state.formStatus == FormStatus.unValid &&
        (currentLocale != localizationUseCase.currentLocale)) {
      forgetPasswordCubit.doIntent(ValidateForm());
      currentLocale = localizationUseCase.currentLocale;
      // WidgetsBinding.instance.addPostFrameCallback(
      //   (timeStamp) {
      //
      //   },
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider(
        create: (context) => forgetPasswordCubit,
        child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            switch (state.forgetPasswordStatus) {
              case ForgotPasswordStatus.initial:
                return;
              case ForgotPasswordStatus.loading:
                displayAlertDialog(title: const LoadingStateWidget());

              case ForgotPasswordStatus.success:
                hideAlertDialog();
                displayAlertDialog(
                  title: Text(
                    appLocalizations.otpSendSuccessfully,
                    textAlign: TextAlign.center,
                  ),
                  showOkButton: true,
                  onOkButtonClick: () {
                    forgetPasswordScreenPageController.jumpToPage(1);
                  },
                );
              case ForgotPasswordStatus.error:
                hideAlertDialog();
                displayAlertDialog(
                  title: ErrorStateWidget(error: state.error!),
                  showOkButton: true,
                );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: forgetPasswordCubit.formKey,
                onChanged: () {
                  forgetPasswordCubit.doIntent(ValidateForm());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      appLocalizations.forgetPassword,
                      style: AppThemes.styles18w500black15,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      appLocalizations.enterAssociatedEmail,
                      style: AppThemes.styles14w400grey,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      controller: widget.emailController,
                      validator: (inputText) {
                        return validateFunctions.validationOfEmail(inputText);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: appLocalizations.email,
                        hintText: appLocalizations.enterYourEmail,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
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
                                  forgetPasswordCubit.doIntent(
                                    OnForgotPasswordButtonClicked(
                                        email: widget.emailController.text),
                                  );
                                },
                          text: appLocalizations.continueWord,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
