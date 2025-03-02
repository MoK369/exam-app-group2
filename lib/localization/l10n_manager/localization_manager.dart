import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:exam_app_group2/localization/initializer/initializer.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalizationManager extends ChangeNotifier {
  String currentLocale;
  final StorageService<FlutterSecureStorage> _storageService;
  LocalizationManager(
      this._storageService, @Named("initCurrentLocal") this.currentLocale);

  void changeLocal(String languageCode) {
    currentLocale = languageCode;
    saveLocal(languageCode);
    notifyListeners();
  }

  void saveLocal(String languageCode) {
    _storageService.setStringValue(StorageConstants.localKey, languageCode);
  }

  Future<String?> getSavedLocal() async {
    var savedLocale =
        await _storageService.getStringValue(StorageConstants.localKey);
    return savedLocale;
  }
}
