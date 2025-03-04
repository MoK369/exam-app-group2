import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/settings_layout/dialogs/language_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsLayout extends StatefulWidget {
  const SettingsLayout({super.key});

  @override
  State<SettingsLayout> createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends BaseStatefulWidgetState<SettingsLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onTap: () => showLanguagesDialog(),
            leading: const Icon(Icons.language_outlined),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appLocalizations.language),
                Text(
                  LanguagesCodes.getLanguageName(
                      localizationUseCase.currentLocale),
                  style: theme.listTileTheme.titleTextStyle!
                      .copyWith(color: AppColors.black[40], fontSize: 16.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          ListTile(
            onTap: () {},
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
            onTap: () {},
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
}
