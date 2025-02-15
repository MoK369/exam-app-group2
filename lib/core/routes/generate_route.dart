import 'package:exam_app_group2/core/routes/defined_routes.dart';
<<<<<<< Updated upstream
=======
import 'package:exam_app_group2/modules/authentication/screens/sign_up_screen.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/confirm_password.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/emial_verfication_screen.dart';
import 'package:exam_app_group2/modules/forget%20password/screens/forget_password.dart';
>>>>>>> Stashed changes
import 'package:exam_app_group2/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;
<<<<<<< Updated upstream
    if (name == DefinedRoutes.homeRouteName) {
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
=======
    switch (name) {
      case DefinedRoutes.homeRouteName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case DefinedRoutes.signUpRouteName:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case DefinedRoutes.forgetPasswordName :
        return MaterialPageRoute(
          builder: (context)=> const ForgetPassword()
        );
      case DefinedRoutes.emailVerficationName: 
        return MaterialPageRoute(
          builder: (context)=> const EmialVerficationScreen() 
        );
      case DefinedRoutes.confirmPasswordName :
        return MaterialPageRoute(
          builder: (context)=> const ConfirmPassword() 
        );
      default:
        return _errorRoute();
>>>>>>> Stashed changes
    }

    return null;
  }
}
