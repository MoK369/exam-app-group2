import 'package:exam_app_group2/modules/authentication/ui/sign_up/sign_up_screen.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/edit_profile_screen.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/reset_password/reset_password_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import '../../modules/authentication/ui/login/view/login_view.dart';
import 'defined_routes.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;
    switch (name) {
      case DefinedRoutes.homeRouteName:
        HomeScreenParameters homeScreenParameters =
            (args as HomeScreenParameters);
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            authEntity: homeScreenParameters.authEntity,
            rememberMe: homeScreenParameters.rememberMe,
          ),
        );
      case DefinedRoutes.signUpRouteName:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );

      case DefinedRoutes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case DefinedRoutes.editProfileRoutName:
        return MaterialPageRoute<bool>(
          builder: (context) => EditProfileScreen(
            authEntity: (args as AuthenticationResponseEntity),
          ),
        );
      case DefinedRoutes.resetPasswordRoutName:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(
      {String? initialRoute,
      required AuthenticationResponseEntity? storedAuthEntity,
      bool rememberMe = false}) {
    return [
      if (storedAuthEntity != null)
        MaterialPageRoute(
          builder: (context) => HomeScreen(authEntity: storedAuthEntity),
        )
      else
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        )
    ];
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
