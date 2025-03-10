import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/home/domain/entities/exam_result_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_contract.dart';
import 'package:flutter/material.dart';

class ResultLayout extends StatefulWidget {
  const ResultLayout({super.key});

  @override
  State<ResultLayout> createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  var isarExamEntityService = getIt.get<IsarStorageService<ExamResultEntity>>();
  var isarQuestionEntityService =
      getIt.get<IsarStorageService<QuestionEntity>>();

  @override
  void initState() {
    super.initState();
    print("In Result");
    print("${authEntity.token} & ${authEntity.user?.email}");
    getAllData();
  }

  void getAllData() async {
    var checkQuestionEntities = await isarExamEntityService.readAll();
    print(checkQuestionEntities[0].correctQuestions?[0].question);
    var question = await isarQuestionEntityService
        .findBy(checkQuestionEntities[0].correctQuestions?[0].qid ?? "");
    print(question?.answers?[0].answer);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.green,
    );
  }
}
