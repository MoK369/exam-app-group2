import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/home/UI/view_model/home_view_model.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final bool? rememberMe;
  final AuthenticationResponseEntity authEntity;
  const HomeScreen({super.key, required this.authEntity, this.rememberMe});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen>
    with WidgetsBindingObserver {
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    if (widget.authEntity.message != StorageConstants.storedMessage) {
      print("Logged in Successfully");
      print(widget.authEntity.user?.email ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.detached) {
      print("Home screen Detached");
      if (widget.rememberMe == false) {
        homeViewModel.deleteLoginInfo();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }
}

class HomeScreenParameters {
  AuthenticationResponseEntity authEntity;
  bool rememberMe;

  HomeScreenParameters({required this.authEntity, required this.rememberMe});
}
