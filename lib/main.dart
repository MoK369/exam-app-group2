import 'package:exam_app_group2/core/providers/error/error_notifier.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/di/injectable_initializer.dart';
import 'core/routing/generate_route.dart';
import 'modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'modules/authentication/domain/use_cases/login/login_use_case.dart';

AuthenticationResponseEntity? storedAuthEntity;

void main() async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await ScreenUtil.ensureScreenSize();
  // Initializing local storage (Flutter Secure Storage) happens here
  configureDependencies();
  // Get Cached Login Info
  storedAuthEntity = await getIt.get<LoginUseCase>().getLoginInfo();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => getIt.get<LocalizationManager>(),
    ),
    ChangeNotifierProvider(
      create: (context) => getIt.get<ErrorNotifier>(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Consumer<LocalizationManager>(
          builder: (BuildContext context,
              LocalizationManager localizationManager, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              themeMode: ThemeMode.light,
              locale: Locale(localizationManager.currentLocale),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              onGenerateRoute: GenerateRoute.onGenerateRoute,
              onGenerateInitialRoutes: (initialRoute) =>
                  GenerateRoute.onGenerateInitialRoutes(
                      initialRoute: initialRoute,
                      storedAuthEntity: storedAuthEntity),
            );
          },
        );
      },
    );
  }
}
