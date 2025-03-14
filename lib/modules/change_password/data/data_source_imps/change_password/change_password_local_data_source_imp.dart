import 'dart:convert';

import 'package:exam_app_group2/modules/authentication/data/models/authentication/response/authentication_response.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/change_password/data/data_source_contracts/change_password/change_password_local_data_source.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/response/change_password_response_entity.dart';
import 'package:exam_app_group2/modules/change_password/ui/change_password_screen.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordLocalDataSource)
class ChangePasswordLocalDataSourceImp
    implements ChangePasswordLocalDataSource {
  StorageService<FlutterSecureStorage> storageService;

  ChangePasswordLocalDataSourceImp(this.storageService);

  @override
  Future<void> cacheToken(AuthenticationResponseEntity authEntity) async {
    var authDto =
        AuthenticationResponseDto.convertIntoAuthenticationDto(authEntity);
    return storageService.setStringValue(StorageConstants.authModelKey,
        jsonEncode(authDto.toJson()), ChangePasswordScreen.widgetName);
  }

  @override
  Future<AuthenticationResponseEntity> getCachedToken() async {
    var authDtoString = await storageService.getStringValue(
        StorageConstants.authModelKey, ChangePasswordScreen.widgetName);
    var authDto =
        AuthenticationResponseDto.fromJson(jsonDecode(authDtoString ?? "{}"));
    return authDto.convertIntoEntity();
  }

  @override
  Future<void> updateToken(
      ChangePasswordResponseEntity changePasswordResponseEntity) async {
    var oldEntity = await getCachedToken();
    var newEntity = AuthenticationResponseEntity(
        message: oldEntity.message,
        token: changePasswordResponseEntity.token ?? oldEntity.token,
        user: oldEntity.user);
    debugPrint("New Token will be saved: ${newEntity.token}");
    return cacheToken(newEntity);
  }
}
