import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_rich_text.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/core/widgets/verfication_row.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/forget_password_layout/view_model/forget_password_cubit.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/view_model/verify_email_cubit.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/view_model/verify_email_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../forget_password_screen.dart';

class EmailVerificationLayout extends StatefulWidget {
  final String email;

  const EmailVerificationLayout({super.key, required this.email});

  @override
  State<EmailVerificationLayout> createState() =>
      _EmailVerificationLayoutState();
}

class _EmailVerificationLayoutState
    extends BaseStatefulWidgetState<EmailVerificationLayout> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  final VerifyEmailCubit verifyEmailCubit = getIt.get<VerifyEmailCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider(
          create: (context) => verifyEmailCubit,
          child: BlocListener<VerifyEmailCubit, VerifyEmailState>(
            listener: (context, state) {
              print(widget.email);
              switch (state.emailVerificationStatus) {
                case Status.initial:
                  break;
                case Status.loading:
                  displayAlertDialog(title: const LoadingStateWidget());
                case Status.success:
                  hideAlertDialog();
                  displayAlertDialog(
                    title: Text(appLocalizations.emailVerified),
                    showOkButton: true,
                    onOkButtonClick: () {
                      forgetPasswordScreenPageController.jumpToPage(2);
                    },
                  );
                case Status.error:
                  hideAlertDialog();
                  displayAlertDialog(
                      title: ErrorStateWidget(error: state.error!),
                      showOkButton: true);
              }
              switch (state.resendCodeStatus) {
                case Status.initial:
                  break;
                case Status.loading:
                  displayAlertDialog(title: const LoadingStateWidget());
                case Status.success:
                  hideAlertDialog();
                  displayAlertDialog(
                    title: Text(appLocalizations.emailVerified),
                    showOkButton: true,
                    onOkButtonClick: () {
                      forgetPasswordScreenPageController.jumpToPage(2);
                    },
                  );
                case Status.error:
                  hideAlertDialog();
                  displayAlertDialog(
                      title: ErrorStateWidget(error: state.error!),
                      showOkButton: true);
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30.h),
                  Center(
                    child: Text(
                      appLocalizations.emilVerification,
                      style: AppThemes.styles18w500black15,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: Text(
                      appLocalizations.enterOTPSentToTheEmail,
                      style: AppThemes.styles14w400grey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  VerificationCodeRow(
                    controllers: _controllers,
                    focusNodes: _focusNodes,
                    onCompleted: () {
                      verifyEmailCubit.doIntent(SubmitCode(
                          codeDigits:
                              _controllers.map((cont) => cont.text).toList()));
                    },
                  ),
                  SizedBox(height: 25.h),
                  Center(
                    child: CustomRichText(
                      text: appLocalizations.didNotReceiveCode,
                      actionText: appLocalizations.resend,
                      onActionTap: () {
                        verifyEmailCubit.doIntent(
                          OnResendCodeClick(widget.email),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
