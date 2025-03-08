import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:flutter/material.dart';

class ExploreLayout extends StatefulWidget {
  const ExploreLayout({super.key});

  @override
  State<ExploreLayout> createState() => _ExploreLayoutState();
}

class _ExploreLayoutState extends State<ExploreLayout> {
  @override
  void initState() {
    super.initState();
    print("In Explore");
    print(
        "${authEntity.token} & ${authEntity.user?.email} \n ${authEntity.user?.username}");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.red,
    );
  }
}
