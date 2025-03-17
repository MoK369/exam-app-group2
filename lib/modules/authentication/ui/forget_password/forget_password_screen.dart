import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/confirm_password_layout/confirm_password_layout.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/forget_password_layout/forget_password_layout.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/email_verification_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late PageController forgetPasswordScreenPageController;

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState
    extends BaseStatefulWidgetState<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  late final List<Widget> layouts;

  @override
  void initState() {
    super.initState();
    forgetPasswordScreenPageController = PageController();
    layouts = [
      ForgetPasswordLayout(
        emailController: emailController,
      ),
      EmailVerificationLayout(email: emailController.text),
      ConfirmPasswordLayout(email: emailController.text)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.password,
        showLocaleButton: true,
      ),
      body: PageView(
        controller: forgetPasswordScreenPageController,
        physics: const NeverScrollableScrollPhysics(),
        children: layouts,
      ),
    );
  }
}
