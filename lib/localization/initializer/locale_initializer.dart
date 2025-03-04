import 'package:exam_app_group2/core/languages/language_codes.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocaleInitializer {
  @preResolve
  @Named("initCurrentLocal")
  Future<String> initCurrentLocal(
      StorageService<FlutterSecureStorage> storageService) async {
    var savedLocale =
        await storageService.getStringValue(StorageConstants.localKey);
    return savedLocale ?? LanguagesCodes.english;
  }
}
