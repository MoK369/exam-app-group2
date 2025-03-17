import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:exam_app_group2/localization/l10n_manager/local_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalizationManager extends Cubit<LocaleState> {
  String currentLocale = LanguagesCodes.english;
  LocalizationManager() : super(const LocaleState());

  void changeLocal(String languageCode) {
    switch (languageCode) {
      case LanguagesCodes.english:
        currentLocale = LanguagesCodes.english;
        emit(const LocaleState());
      case LanguagesCodes.arabic:
        currentLocale = LanguagesCodes.arabic;
        emit(LocaleState(
            state: LocaleStatus.arabic, languageCode: languageCode));
      default:
        currentLocale = LanguagesCodes.english;
        emit(const LocaleState());
    }
  }
}
