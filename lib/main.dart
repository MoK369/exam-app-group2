import 'package:exam_app_group2/core/providers/error/error_notifier.dart';
import 'package:exam_app_group2/core/themes/app_themes.dart';
import 'package:exam_app_group2/localization/l10n_manager/localization_manager.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_result_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_contract.dart';
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
  // Initializing local storage (Flutter Secure Storage) and current locale (Stored Locale) happens here
  await configureDependencies();
  // Get Cached Login Info
  storedAuthEntity = await getIt.get<LoginUseCase>().getStoredLoginInfo();

  var isarExamEntityService = getIt.get<IsarStorageService<ExamResultEntity>>();
  var isarQuestionEntityService =
      getIt.get<IsarStorageService<QuestionEntity>>();
  await isarExamEntityService.write(
    ExamResultEntity(
      examId: "670070a830a3c3c1944a9c63",
      correctQuestions: [
        CheckedQuestion(
            qid: "670082800a5849a4aee16294",
            question: "Who is making the Web standards?")
      ],
      wrongQuestions: [
        CheckedQuestion(
            qid: "6700829e0a5849a4aee16297",
            question: "Choose the correct HTML element for the largest heading")
      ],
    ),
  );
  await isarExamEntityService.write(
    ExamResultEntity(
      examId: "670070a830a3c3c1944a9c63",
      correctQuestions: [
        CheckedQuestion(
            qid: "670082800a5849a4aee16294",
            question: "Who is making the Web standards?")
      ],
      wrongQuestions: [
        CheckedQuestion(
            qid: "6700829e0a5849a4aee16297",
            question: "Choose the correct HTML element for the largest heading")
      ],
    ),
  );
  await isarQuestionEntityService.write(QuestionEntity(
      id: "670082800a5849a4aee16294",
      question: "Who is making the Web standards?",
      answers: [
        Answer(answer: "Answer 1", key: "A2"),
        Answer(answer: "Answer 2", key: "A1")
      ]));

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
