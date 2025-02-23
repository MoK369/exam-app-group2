import 'dart:convert';

import 'package:exam_app_group2/core/storage/constants/storage_keys.dart';
import 'package:exam_app_group2/core/storage/storage_service.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/auth_local_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/model/authentication/response/authentication_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/authentication/authentication_response_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  StorageService<FlutterSecureStorage> storageService;

  AuthLocalDataSourceImpl({required this.storageService});

  @override
  Future<AuthenticationResponseEntity?> getCashedUser() async {
    //======== We need all authentication response user and toke ========//
    // final token = await storageService.getStringValue('token');
    // return token;
    String stringAuthDto =
        await storageService.getStringValue(StorageKeys.authModelKey) ?? "";
    AuthenticationResponseDto authDto =
        AuthenticationResponseDto.fromJson(jsonDecode(stringAuthDto));
    return authDto.convertIntoAuthenticationEntity();
  }

  @override
  void cashUser({required AuthenticationResponseEntity authEntity}) {
    var authDto =
        AuthenticationResponseDto.convertIntoAuthenticationDto(authEntity);
    storageService.setStringValue(
        StorageKeys.authModelKey, jsonEncode(authDto.toJson()));
  }
}
