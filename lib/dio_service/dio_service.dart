import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://exam.elevateegy.com/"));

  DioService() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) {
        debugPrint(object.toString());
      },
    ));
  }

  Dio get getDio => _dio;
}
