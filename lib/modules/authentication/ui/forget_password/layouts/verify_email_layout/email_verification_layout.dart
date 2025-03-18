import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/core/widgets/custom_rich_text.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/core/widgets/verfication_row.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/view_model/verify_email_cubit.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/view_model/verify_email_states.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/view_model/forget_password_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../forget_password_screen.dart';

class EmailVerificationLayout extends StatefulWidget {
  const EmailVerificationLayout({super.key});

  @override
  State<EmailVerificationLayout> createState() =>
      _EmailVerificationLayoutState();
}

class _EmailVerificationLayoutState
    extends BaseStatefulWidgetState<EmailVerificationLayout> {
  final VerifyEmailCubit verifyEmailCubit = getIt.get<VerifyEmailCubit>();
  late ForgetPasswordScreenViewModel forgetPasswordScreenViewModel;

  @override
  void initState() {
    super.initState();
    verifyEmailCubit.doIntent(StartTimer(25));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    forgetPasswordScreenViewModel =
        Provider.of<ForgetPasswordScreenViewModel>(context);
  }

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
              switch (state.emailVerificationStatus) {
                case Status.initial:
                  break;
                case Status.loading:
                  displayAlertDialog(title: const LoadingStateWidget());
                case Status.success:
                  hideAlertDialog();
                  displayAlertDialog(
                    title: Text(
                      appLocalizations.emailVerified,
                      textAlign: TextAlign.center,
                    ),
                    showOkButton: true,
                    onOkButtonClick: () {
                      hideAlertDialog();
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
                    title: Text(
                      appLocalizations.otpSendSuccessfully,
                      textAlign: TextAlign.center,
                    ),
                    showOkButton: true,
                    onOkButtonClick: () {
                      hideAlertDialog();
                      verifyEmailCubit.doIntent(StartTimer(25));
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
                  BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
                    buildWhen: (previous, current) {
                      if (previous.emailVerificationStatus !=
                          current.emailVerificationStatus) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          VerificationCodeRow(
                            formKey: verifyEmailCubit.formKey,
                            isSendCodeInvalid: state.isSendCodeInvalid,
                            controllers: verifyEmailCubit.controllers,
                            focusNodes: verifyEmailCubit.focusNodes,
                            onCompleted: () {
                              verifyEmailCubit.doIntent(SubmitCode());
                            },
                          ),
                          if (state.isSendCodeInvalid)
                            SizedBox(
                              height: 8.h,
                            ),
                          if (state.isSendCodeInvalid)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.error_outline_outlined,
                                  size: 18,
                                  color: AppColors.red,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  appLocalizations.invalidCode,
                                  style: theme.textTheme.labelSmall!
                                      .copyWith(color: AppColors.red),
                                ),
                              ],
                            )
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 25.h),
                  ValueListenableBuilder<int>(
                    valueListenable: verifyEmailCubit.timeRemaining,
                    builder: (context, value, child) {
                      return value >= 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.timer,
                                  size: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  value > 9 ? "00:$value" : "00:0$value",
                                  style: theme.textTheme.labelMedium,
                                )
                              ],
                            )
                          : Center(
                              child: CustomRichText(
                                text: appLocalizations.didNotReceiveCode,
                                actionText: appLocalizations.resend,
                                onActionTap: () {
                                  verifyEmailCubit.doIntent(
                                    OnResendCodeClick(
                                        forgetPasswordScreenViewModel.email),
                                  );
                                },
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    verifyEmailCubit.doIntent(DisposeTimerAndValueNotifier());
    verifyEmailCubit.doIntent(DisposeControllersAndFocusNodes());
  }
}
