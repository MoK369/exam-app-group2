import 'dart:convert';

import 'package:exam_app_group2/modules/authentication/data/models/authentication/response/authentication_response.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/user/user_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/data/data_source_contracts/edit_profile/edit_profile_local_data_source.dart';
import 'package:exam_app_group2/modules/edit_profile/domain/entities/edit_profile/request/edit_profile_request_entity.dart';
import 'package:exam_app_group2/modules/edit_profile/ui/edit_profile_screen.dart';
import 'package:exam_app_group2/storage/constants/storage_constants.dart';
import 'package:exam_app_group2/storage/contracts/storage_service_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileLocalDataSource)
class EditProfileLocalDataSourceImp implements EditProfileLocalDataSource {
  StorageService<FlutterSecureStorage> storageService;

  EditProfileLocalDataSourceImp(this.storageService);

  @override
  Future<AuthenticationResponseEntity> getCachedUser() async {
    var authDtoString = await storageService.getStringValue(
        StorageConstants.authModelKey, EditProfileScreen.widgetName);
    var authDto =
        AuthenticationResponseDto.fromJson(jsonDecode(authDtoString ?? "{}"));
    return authDto.convertIntoEntity();
  }

  @override
  Future<void> updateCachedUser(EditProfileRequestEntity newEntity) async {
    var authEntity = await getCachedUser();
    var odlUser = authEntity.user ?? UserEntity();
    var newUser = UserEntity(
        id: odlUser.id,
        username: newEntity.username ?? odlUser.username,
        firstName: newEntity.firstName ?? odlUser.firstName,
        lastName: newEntity.lastName ?? odlUser.lastName,
        email: newEntity.email ?? odlUser.email,
        phone: newEntity.phone ?? odlUser.phone,
        role: odlUser.role,
        isVerified: odlUser.isVerified,
        createdAt: odlUser.createdAt);
    debugPrint("New User that will be saved: \n ${newUser.toString()}");
    return cacheUser(AuthenticationResponseEntity(
        message: authEntity.message, token: authEntity.token, user: newUser));
  }

  @override
  Future<void> cacheUser(AuthenticationResponseEntity authEntity) async {
    var authDto =
        AuthenticationResponseDto.convertIntoAuthenticationDto(authEntity);
    return storageService.setStringValue(StorageConstants.authModelKey,
        jsonEncode(authDto.toJson()), EditProfileScreen.widgetName);
  }
}
