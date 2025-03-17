import 'dart:developer';

import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/validation/validation_functions.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/custom_button.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/confirm_password_layout/view_model/reset_password_cubit.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/confirm_password_layout/view_model/reset_password_status.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPasswordLayout extends StatefulWidget {
  final String email;

  const ConfirmPasswordLayout({super.key, required this.email});

  @override
  State<ConfirmPasswordLayout> createState() => _ConfirmPasswordLayoutState();
}

class _ConfirmPasswordLayoutState
    extends BaseStatefulWidgetState<ConfirmPasswordLayout> {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  ResetPasswordCubit resetPasswordCubit = getIt<ResetPasswordCubit>();

  late ValidateFunctions validateFunctions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    validateFunctions = ValidateFunctions.getInstance(appLocalizations);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => resetPasswordCubit,
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Text(
                      "Reset password",
                      style: AppThemes.styles18w500black15,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Center(
                    child: Text(
                      "Password must not be empty and must contain\n6 characters with upper case letter and one \nnumber at least ",
                      style: AppThemes.styles14w400grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  TextFormField(
                    controller: newPassword,
                    validator: (inputText) {
                      return validateFunctions.validationOfPassword(inputText);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "New password",
                      hintText: "Enter you password",
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    controller: confirmPassword,
                    validator: (inputText) {
                      return validateFunctions.validationOfConfirmPassword(
                          inputText, newPassword);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Confirm password",
                      hintText: "Confirm password",
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomElevatedButton(
                    onTap: onContinueClick,
                    text: "Continue",
                  ),
                ],
              ),
            ),
          );
        }, listener: (context, state) {
          if (state.isError) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text(
                  " error ",
                ),
              ),
            );
          } else if (state.isSuccess) {
            // Navigator.pushReplacementNamed(
            //      context,
            //      DefinedRoutes.emailVerficationName,
            //      arguments: widget.email
            //    );
          }
        }));
  }

  void onContinueClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    log("inside confirm page ");
    resetPasswordCubit.doIntent(
      OnResetPasswordClicked(mail: widget.email, newPassword: newPassword.text),
    );

    // if (formKey.currentState?.validate() == true) {
    //   resetPasswordCubit.doIntent(
    //     OnResetPasswordClicked(mail:"aa" , newPassword: confirmPassword.text  ),
    //   );
    // }
  }
}
