import 'package:exam_app_group2/localization/use_case/localization_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../di/injectable_initializer.dart';

abstract class BaseStatefulWidgetState<T extends StatefulWidget>
    extends State<T> {
  late ThemeData theme;
  late AppLocalizations appLocalizations;
  final LocalizationUseCase localizationUseCase =
      getIt.get<LocalizationUseCase>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    appLocalizations = localizationUseCase.get(context);
  }

  void displayAlertDialog(
      {required Widget title,
      bool showOkButton = false,
      bool isDismissible = false}) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return AlertDialog(
          title: title,
          actions: !showOkButton
              ? null
              : [
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        appLocalizations.ok,
                        style: theme.textTheme.labelMedium!
                            .copyWith(color: Colors.white),
                      ))
                ],
        );
      },
    );
  }

  void hideAlertDialog() {
    Navigator.pop(context);
  }
}
