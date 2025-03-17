import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/forget_password_screen.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/confirm_password_layout/confirm_password_layout.dart';
import 'package:exam_app_group2/modules/authentication/ui/forget_password/layouts/verify_email_layout/email_verification_layout.dart';

import 'package:exam_app_group2/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;

    switch (name) {
      case DefinedRoutes.homeRouteName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case DefinedRoutes.forgetPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );
      // case DefinedRoutes.forgetPasswordName:
      //   return MaterialPageRoute(builder: (context) => const ForgetPassword());
      // case DefinedRoutes.emailVerficationName:
      //   return MaterialPageRoute(builder: (context) {
      //     final email = settings.arguments as String;
      //     return EmailVerificationLayout(
      //       email: email,
      //     );
      //   });
      // case DefinedRoutes.confirmPasswordName:
      //   return MaterialPageRoute(builder: (context) {
      //     final email = settings.arguments as String;
      //     return ConfirmPasswordLayout(
      //       email: email,
      //     );
      //   });
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Container(
          color: Colors.red,
          child: const Center(
            child: Text(
              "Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
