import 'package:exam_app_group2/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalizationUseCase {
  final LocalizationManager localizationManager;

  LocalizationUseCase(this.localizationManager);

  void changeLocale(String languageCode) {
    localizationManager.changeLocal(languageCode);
  }

  AppLocalizations get(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
