import 'dart:convert';

import 'package:exam_app_group2/modules/authentication/data/data_sources_contracts/auth_local_datasource.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/authentication/authentication_response_entity.dart';
import '../models/authentication/response/authentication_response.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  StorageService<FlutterSecureStorage> storageService;

  AuthLocalDataSourceImpl({required this.storageService});

  @override
  Future<AuthenticationResponseEntity?> getCashedUser() async {
    String? stringAuthDto =
        await storageService.getStringValue(StorageConstants.authModelKey);
    if (stringAuthDto != null) {
      AuthenticationResponseDto authDto =
          AuthenticationResponseDto.fromJson(jsonDecode(stringAuthDto));
      return authDto.convertIntoAuthenticationEntity();
    }
    return null;
  }

  @override
  void cashUser({required AuthenticationResponseEntity authEntity}) {
    var authDto =
        AuthenticationResponseDto.convertIntoAuthenticationDto(authEntity);
    storageService.setStringValue(
        StorageConstants.authModelKey, jsonEncode(authDto.toJson()));
  }

  @override
  Future<void> deleteCachedUser() {
    return storageService.deleteValue(StorageConstants.authModelKey);
  }
}
