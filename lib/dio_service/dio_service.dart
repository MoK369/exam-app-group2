import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/apis_endpoints/apis_endpoints.dart';
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
        headers: {
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YmYwZjU0NTU1NGIzMjg5MTI1YWY5NCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQxMTE3NjYxfQ.77jGz96V142YC6ZEU1b5Kr2ZuGYA4naDPmhIG1gAFHg',
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
      // LogInterceptor(
      //   requestBody: true,
      //   responseBody: true,
      //   logPrint: (object) {
      //     debugPrint(object.toString());
      //   },
      // ),
    );
    return dio;
  }
}
