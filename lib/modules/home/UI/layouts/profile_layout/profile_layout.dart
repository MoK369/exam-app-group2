import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:flutter/material.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {

  @override
  void initState() {
    super.initState();
    print("In Profile");
    print("${authEntity.token} & ${authEntity.user?.email}");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.blue,
    );
  }
}
