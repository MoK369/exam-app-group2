import 'package:exam_app_group2/core/routes/defined_routes.dart';
import 'package:exam_app_group2/core/routes/generate_route.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
<<<<<<< Updated upstream
      child: MaterialApp(
        theme: AppThemes.lightTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: GenerateRoute.onGenerateRoute,
        initialRoute: DefinedRoutes.homeRouteName,
      ),
=======
      builder: (context, child) {
        return MaterialApp( 
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          themeMode: ThemeMode.light,
          onGenerateRoute: GenerateRoute.onGenerateRoute,
          initialRoute: DefinedRoutes.confirmPasswordName,
        );
      },
>>>>>>> Stashed changes
    );
  }
}
