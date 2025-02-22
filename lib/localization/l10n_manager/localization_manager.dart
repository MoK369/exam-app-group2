import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalizationManager extends ChangeNotifier {
  late String currentLocale;
  LocalizationManager(){
    currentLocale = LanguagesCodes.english;
  }

  void changeLocal(String languageCode) {
    currentLocale = languageCode;
    notifyListeners();
  }
}
