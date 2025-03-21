import 'package:exam_app_group2/core/bases/base_stateful_widget_state.dart';
import 'package:exam_app_group2/core/colors/app_colors.dart';
import 'package:exam_app_group2/core/enumerators/languages/languages_enum.dart';
import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:flutter/material.dart';

class LanguageDialog extends StatefulWidget {
  static const String widgetName = "LanguageDialog";

  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends BaseStatefulWidgetState<LanguageDialog> {
  late LanguagesEnum chosenLanguage;
  late ScrollController scrollController;
  bool showTopDivider = false, showBottomDivider = true;

  var languagesList = LanguagesEnum.values;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(
      () {
        scrollListener();
      },
    );
  }

  void scrollListener() {
    if (scrollController.offset == 0) {
      setState(() {
        showTopDivider = false;
      });
    }
    if (scrollController.offset > 0) {
      setState(() {
        showTopDivider = true;
        showBottomDivider = true;
      });
    }
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      setState(() {
        showBottomDivider = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initErrorNotifier(context, LanguageDialog.widgetName);
    chosenLanguage = localizationUseCase.currentLocale == LanguagesCodes.english
        ? LanguagesEnum.en
        : LanguagesEnum.ar;
    LanguagesEnum.ar.getLanguageCode();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(appLocalizations.language),
      content: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            minWidth: MediaQuery.of(context).size.width * 0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTopDivider) const Divider(height: 1),
            Scrollbar(
              controller: scrollController,
              child: SingleChildScrollView(
                child: Column(
                  children: List<Widget>.generate(
                    languagesList.length,
                    (index) {
                      return ListTile(
                        tileColor: AppColors.white,
                        leading: Radio<LanguagesEnum>(
                          value: languagesList[index],
                          groupValue: chosenLanguage,
                          onChanged: (value) {
                            setState(() {
                              chosenLanguage = value!;
                            });
                          },
                        ),
                        title: Text(
                          LanguagesCodes.getLanguageName(
                              languagesList[index].getLanguageCode()),
                        ),
                        onTap: () {
                          setState(() {
                            chosenLanguage = languagesList[index];
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            if (showBottomDivider) const Divider(height: 1),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            hideAlertDialog();
          },
          child: Text(appLocalizations.cancelWord),
        ),
        TextButton(
          onPressed: () {
            onOkButtonClick();
          },
          child: Text(appLocalizations.ok),
        ),
      ],
    );
  }

  void onOkButtonClick() {
    if (localizationUseCase.currentLocale != chosenLanguage.getLanguageCode()) {
      localizationUseCase.changeLocale(
          chosenLanguage.getLanguageCode(), LanguageDialog.widgetName);
    }
    hideAlertDialog();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
