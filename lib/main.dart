import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/localization/l10n_manager/local_state.dart';
import 'package:exam_app_group2/localization/l10n_manager/localization_manager.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/di/injectable_initializer.dart';
import 'core/routing/defined_routes.dart';
import 'core/routing/generate_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'modules/authentication/domain/usecases/login_use_case.dart';

AuthenticationResponseEntity? storedAuthEntity;
void main() async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await ScreenUtil.ensureScreenSize();
  configureDependencies();

  // Initializing local storage
  final storageService = getIt.get<StorageService<FlutterSecureStorage>>();
  await storageService.initStorage();
  // Get Cached Login Info
  storedAuthEntity = await getIt.get<LoginUseCase>().getLoginInfo();

  runApp(BlocProvider(
      create: (context) => getIt.get<LocalizationManager>(),
      child: const MyApp()));
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
        return BlocBuilder<LocalizationManager, LocaleState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              themeMode: ThemeMode.light,
              locale: Locale(state.languageCode),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              onGenerateRoute: GenerateRoute.onGenerateRoute,
              onGenerateInitialRoutes: (initialRoute) => GenerateRoute.onGenerateInitialRoutes(initialRoute: initialRoute,storedAuthEntity: storedAuthEntity),
              initialRoute: DefinedRoutes.login,
            );
          },
        );
      },
    );
  }
}
