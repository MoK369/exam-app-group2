import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalizationManager extends ChangeNotifier {
  String currentLocale;
  final StorageService<FlutterSecureStorage> _storageService;

  String currentLocale = LanguagesCodes.english;
  LocalizationManager(
      this._storageService, @Named("initCurrentLocal") this.currentLocale);

  void changeLocal(String languageCode, String widgetName) {
    currentLocale = languageCode;
    saveLocal(languageCode, widgetName);
    notifyListeners();
  }

  void saveLocal(String languageCode, String widgetName) {
    _storageService.setStringValue(
        StorageConstants.localKey, languageCode, widgetName);
  }

  Future<String?> getSavedLocal(String widgetName) async {
    var savedLocale = await _storageService.getStringValue(
        StorageConstants.localKey, widgetName);
    return savedLocale;
  }
}
