import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:flutter/material.dart';

class ResultLayout extends StatefulWidget {
  const ResultLayout({super.key});

  @override
  State<ResultLayout> createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  @override
  void initState() {
    super.initState();
    print("In Result");
    print("${authEntity.token} & ${authEntity.user?.email}");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.green,
    );
  }
}
