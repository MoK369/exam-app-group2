import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/home/domain/entities/check_question_entity.dart';
import 'package:exam_app_group2/storage/contracts/isar_storage_service_contract.dart';
import 'package:flutter/material.dart';

class ResultLayout extends StatefulWidget {
  const ResultLayout({super.key});

  @override
  State<ResultLayout> createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  var isarService = getIt.get<IsarStorageService<CheckQuestionEntity>>();

  @override
  void initState() {
    super.initState();
    print("In Result");
    print("${authEntity.token} & ${authEntity.user?.email}");
    getAllData();
  }

  void getAllData() async {
    var checkQuestionEntities = await isarService.getAllObjects();
    print(checkQuestionEntities);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.green,
    );
  }
}
