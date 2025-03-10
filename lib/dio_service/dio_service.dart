import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/apis_endpoints/apis_endpoints.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioService {
  @preResolve
  Future<Dio> provideDio() async {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        baseUrl: ApisEndpoints.baseUrl,
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
