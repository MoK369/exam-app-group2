import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/localization/use_case/localization_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  BaseStatelessWidget({super.key});

  final LocalizationUseCase localizationUseCase =
      getIt.get<LocalizationUseCase>();
  late ThemeData theme;
  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    appLocalizations = localizationUseCase.get(context);
    return customBuild(context);
  }

  Widget customBuild(BuildContext context);
}
