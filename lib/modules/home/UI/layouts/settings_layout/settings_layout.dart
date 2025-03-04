import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

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
          ListTile(
            onTap: () => showLanguagesDialog(),
            leading: const Icon(Icons.language_outlined),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appLocalizations.language),
                Text(
                  localizationUseCase.localizationManager.currentLocale,
                  style: theme.listTileTheme.titleTextStyle!
                      .copyWith(color: AppColors.black[40]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showLanguagesDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(appLocalizations.language),
            content: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RadioListTile<String>(
                      value: "Test1",
                      groupValue: "Test1",
                      onChanged: (value) {},
                    ),
                    RadioListTile<String>(
                        value: "Test2",
                        groupValue: "Test1",
                        onChanged: (value) {})
                  ],
                ),
              ),
            ));
      },
    );
  }
}
