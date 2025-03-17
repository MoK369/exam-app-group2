import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:exam_app_group2/core/routing/defined_routes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/core/widgets/error_state_widget.dart';
import 'package:exam_app_group2/core/widgets/loading_state_widget.dart';
import 'package:exam_app_group2/modules/home/UI/home_screen.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/settings_layout/dialogs/language_dialog.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/settings_layout/view_model/settings_intent.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/settings_layout/view_model/settings_state.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/settings_layout/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsLayout extends StatefulWidget {
  const SettingsLayout({super.key});

  @override
  State<SettingsLayout> createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends BaseStatefulWidgetState<SettingsLayout> {
  SettingsViewModel settingsViewModel = getIt.get<SettingsViewModel>();

  @override
  void initState() {
    super.initState();
    print("In Settings");
    print(
        "${authEntity.message} \n ${authEntity.token} & ${authEntity.user?.email} \n ${authEntity.user?.username}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => settingsViewModel,
      child: BlocListener<SettingsViewModel, SettingState>(
        listener: (BuildContext context, state) {
          switch (state.settingsStatus) {
            case Status.idle:
              return;
            case Status.loading:
              displayAlertDialog(title: const LoadingStateWidget());
            case Status.success:
              hideAlertDialog();
              displayAlertDialog(
                title: Text(getSuccessMessage(state.successType!)),
                showOkButton: true,
                onOkButtonClick: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    DefinedRoutes.login,
                    (route) => false,
                  );
                },
              );

            case Status.error:
              hideAlertDialog();
              displayAlertDialog(
                  title: ErrorStateWidget(error: state.error!),
                  showOkButton: true);
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: appLocalizations.settings,
            showLeadingIcon: false,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              ListTile(
                tileColor: AppColors.white,
                onTap: () => showLanguagesDialog(),
                leading: const Icon(Icons.language_outlined),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appLocalizations.language),
                    Text(
                      LanguagesCodes.getLanguageName(
                          localizationUseCase.currentLocale),
                      style: theme.listTileTheme.titleTextStyle!.copyWith(
                          color: AppColors.black[40], fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              ListTile(
                tileColor: AppColors.white,
                onTap: () {
                  settingsViewModel.doIntent(OnLogoutButtonClick());
                },
                leading: const Icon(
                  Icons.logout,
                  color: AppColors.red,
                ),
                title: Text(
                  appLocalizations.logout,
                  style: theme.listTileTheme.titleTextStyle!
                      .copyWith(color: AppColors.red),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ListTile(
                tileColor: AppColors.white,
                onTap: () {
                  displayAlertDialog(
                    title: Text(
                      appLocalizations.deletingAccountAlertMessage,
                      textAlign: TextAlign.center,
                    ),
                    isDismissible: true,
                    showConfirmButton: true,
                    onConfirmButtonClick: () {
                      hideAlertDialog();
                      settingsViewModel.doIntent(OnDeleteAccountButtonClick());
                    },
                  );
                },
                leading: const Icon(
                  Icons.delete,
                  color: AppColors.red,
                ),
                title: Text(
                  appLocalizations.deleteAccount,
                  style: theme.listTileTheme.titleTextStyle!
                      .copyWith(color: AppColors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLanguagesDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const LanguageDialog();
      },
    );
  }

  String getSuccessMessage(SuccessType successType) {
    switch (successType) {
      case SuccessType.logout:
        return appLocalizations.loggedOutSuccessfully;
      case SuccessType.deleting:
        return appLocalizations.deletedAccountSuccessfully;
    }
  }
}
