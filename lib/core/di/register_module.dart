import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/api_end_points/api_end_points.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
    ),
  )..interceptors.add(LogInterceptor(
      request: true,
      // Log the request
      requestHeader: true,
      // Log request headers
      requestBody: true,
      // Log request body
      responseHeader: true,
      // Log response headers
      responseBody: true,
      // Log response body
      error: true, // Log errors
    ));

  @lazySingleton
  Dio get dio => _dio;
}
