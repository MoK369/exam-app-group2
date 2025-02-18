import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/domain/use_cases/localization/localization_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
}
