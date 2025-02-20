import 'package:exam_app_group2/modules/authentication/ui/sign_up/sign_up_screen.dart';
import 'package:exam_app_group2/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/authentication/ui/login/view/login_view.dart';
import 'defined_routes.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;
    switch (name) {
      case DefinedRoutes.homeRouteName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case DefinedRoutes.signUpRouteName:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );

      case DefinedRoutes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
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
