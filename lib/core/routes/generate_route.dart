import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:exam_app_group2/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;
    if (name == DefinedRoutes.homeRouteName) {
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    }

    return null;
  }
}
