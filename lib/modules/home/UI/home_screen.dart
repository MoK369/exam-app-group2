import 'package:exam_app_group2/core/assets/assets_paths.dart';
import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/explore_layout/explore_layout.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/profile_layout/profile_layout.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/result_layout/result_layout.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:flutter/material.dart';

import '../../authentication/domain/entities/authentication/authentication_response_entity.dart';

late final AuthenticationResponseEntity authEntity;

class HomeScreen extends StatefulWidget {
  final bool? rememberMe;
  final AuthenticationResponseEntity authEntity;

  const HomeScreen({
    super.key,
    required this.authEntity,
    this.rememberMe,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  int currentSelectedItemIndex = 0;
  final PageController pageViewController = PageController(initialPage: 0);
  List<Widget> layouts = const [
    ExploreLayout(),
    ResultLayout(),
    ProfileLayout(),
  ];

  @override
  void initState() {
    super.initState();
    authEntity = widget.authEntity;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.authEntity.message != StorageConstants.storedMessage) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          displayAlertDialog(
              showOkButton: true,
              title: Text(
                appLocalizations.loggedInSuccessfully,
                style: theme.textTheme.labelMedium,
              ));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentSelectedItemIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentSelectedItemIndex = value;
            pageViewController.jumpToPage(currentSelectedItemIndex);
          });
        },
        destinations: [
          NavigationDestination(
            icon: const ImageIcon(AssetImage(AssetsPaths.homeIcon)),
            label: appLocalizations.explore,
          ),
          NavigationDestination(
            icon: Transform.scale(
              scale: 1.3,
              child: const ImageIcon(AssetImage(AssetsPaths.resultsIcon)),
            ),
            label: appLocalizations.result,
          ),
          NavigationDestination(
            icon: const ImageIcon(AssetImage(AssetsPaths.profileIcon)),
            label: appLocalizations.profile,
          ),
        ],
      ),
      body: PageView(
        controller: pageViewController,
        onPageChanged: (value) {
          setState(() {
            currentSelectedItemIndex = value;
          });
        },
        children: layouts,
      ),
    );
  }
}

class HomeScreenParameters {
  AuthenticationResponseEntity authEntity;
  bool rememberMe;

  HomeScreenParameters({required this.authEntity, required this.rememberMe});
}
