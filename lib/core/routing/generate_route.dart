import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/ui/sign_up/sign_up_screen.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/explore_layout/view_model/exam_score/exam_score_cubit.dart';
import 'package:exam_app_group2/modules/home/data/models/all_questions_response/answer.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/result_layout/exam_answers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import '../../modules/authentication/ui/login/view/login_view.dart';
import '../../modules/home/UI/home_screen.dart';
import '../../modules/home/UI/layouts/explore_layout/views/exam_details_view.dart';
import '../../modules/home/UI/layouts/explore_layout/views/exam_score_view.dart';
import '../../modules/home/UI/layouts/explore_layout/views/exams_view.dart';
import '../../modules/home/UI/layouts/explore_layout/views/questions_view.dart';
import '../../modules/home/data/models/check_questions/answers.dart';
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
      case DefinedRoutes.examScore:
        args as List<dynamic>;
        final examEntity = args[1] as ExamEntity;
        final checkedAnswers = args[0] as List<Answers>;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ExamScoreCubit>(),
            child: ExamScore(
              answers: checkedAnswers,
              examEntity: examEntity,
            ),
          ),
        );
      case DefinedRoutes.questions:
        ExamEntity examEntity = (args as ExamEntity);
        return MaterialPageRoute(
          builder: (context) => QuestionsView(
            examEntity: examEntity,
          ),
        );

      case DefinedRoutes.exams:
        SubjectEntity subjectEntity = (args as SubjectEntity);
        return MaterialPageRoute(
          builder: (context) => ExamsView(
            subjectEntity: subjectEntity,
          ),
        );

      case DefinedRoutes.examDetails:
        ExamEntity examEntity = (args as ExamEntity);
        return MaterialPageRoute(
          builder: (context) => ExamDetailsView(
            examEntity: examEntity,
          ),
        );
      case DefinedRoutes.examAnswers:
        final List<dynamic> args = settings.arguments as List<dynamic>;
        final List<QuestionEntity> questionEntities =
            args[0] as List<QuestionEntity>;
        final List<Answers> answers = args[1] as List<Answers>;
        return MaterialPageRoute(
          builder: (context) => ExamAnswers(
            answers: answers,
            questionEntities: questionEntities,
          ),
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
