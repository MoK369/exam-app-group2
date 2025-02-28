import 'package:exam_app_group2/localization/l10n_manager/localization_manager.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalizationUseCase {
  final LocalizationManager _localizationManager;
  LocalizationUseCase(this._localizationManager);

  void changeLocale(String languageCode) {
    _localizationManager.changeLocal(languageCode);
  }

  AppLocalizations get(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
