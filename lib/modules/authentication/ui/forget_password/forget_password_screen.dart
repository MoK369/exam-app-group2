import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/forget_password_layout/forget_password_layout.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/reset_password_layout/reset_password_layout.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/email_verification_layout.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/view_model/forget_password_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late PageController forgetPasswordScreenPageController;

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState
    extends BaseStatefulWidgetState<ForgetPasswordScreen> {
  var forgetPasswordScreenViewModel =
      getIt.get<ForgetPasswordScreenViewModel>();

  late final List<Widget> layouts;

  @override
  void initState() {
    super.initState();
    forgetPasswordScreenPageController = PageController();
    layouts = [
      const ForgetPasswordLayout(),
      const EmailVerificationLayout(),
      const ResetPasswordLayout()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => forgetPasswordScreenViewModel,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: appLocalizations.password,
            showLocaleButton: true,
          ),
          body: PageView(
            controller: forgetPasswordScreenPageController,
            physics: const NeverScrollableScrollPhysics(),
            children: layouts,
          ),
        ),
      ),
    );
  }
}
