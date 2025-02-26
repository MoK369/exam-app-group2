import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:flutter/material.dart';

import '../../authentication/domain/entities/authentication/authentication_response_entity.dart';

class HomeScreen extends StatefulWidget {
  final bool? rememberMe;
  final AuthenticationResponseEntity authEntity;

  const HomeScreen({super.key, required this.authEntity, this.rememberMe});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    if (widget.authEntity.message != StorageConstants.storedMessage) {
      print("Logged in Successfully");
      print(widget.authEntity.user?.email ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}

class HomeScreenParameters {
  AuthenticationResponseEntity authEntity;
  bool rememberMe;

  HomeScreenParameters({required this.authEntity, required this.rememberMe});
}
