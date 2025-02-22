import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioService {
  @singleton
  Dio provideDio() {
    final Dio dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        baseUrl: "https://exam.elevateegy.com/"));
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
