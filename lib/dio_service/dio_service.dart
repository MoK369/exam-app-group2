import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/apis_endpoints/apis_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioService {
  @singleton
  Dio provideDio() {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        baseUrl: ApisEndpoints.baseUrl,
        headers: {
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YmYwZjU0NTU1NGIzMjg5MTI1YWY5NCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQwNTg1MDM3fQ.p3pCumwu-1YMANH-Uzd9Z4GjPrevB0Oi1OenyUQ4zvM',
        },
      ),
    );
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) {
        debugPrint(object.toString());
      },
    ));
    return dio;
  }
}
