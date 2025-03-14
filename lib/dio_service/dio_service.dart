import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/apis_endpoints/apis_endpoints.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../storage/constants/storage_constants.dart';
import '../storage/contracts/storage_service_contract.dart';

@module
abstract class DioService {
  @preResolve
  Future<String> getToken(
      StorageService<FlutterSecureStorage> storageService) async {
    var result =
        await storageService.getStringValue(StorageConstants.authModelKey);
    return result ?? '';
  }

  @preResolve
  Future<Dio> provideDio() async {
    // var userJson = await getToken(getIt());
    // AuthenticationResponseEntity userEntity =
    //     AuthenticationResponseEntity.fromJson(jsonDecode(userJson));
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        baseUrl: ApisEndpoints.baseUrl,
        headers: {
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YmYwZjU0NTU1NGIzMjg5MTI1YWY5NCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQxNTI2NDI3fQ.RywqaBjuvvNDIFkRFu0S5gQLE4CgQV9_eM4Vm5MKs3I',
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );
    return dio;
  }
}

extension DioServiceExtension on DioService {
  static void updateDioWithToken(String token) {
    Dio dio = getIt.get<Dio>();
    BaseOptions newBaseOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        baseUrl: ApisEndpoints.baseUrl,
        headers: {"token": token});
    dio.options = newBaseOptions;
  }
}
