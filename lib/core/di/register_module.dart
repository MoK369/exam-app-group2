import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/utils/app_endPoints.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: EndPointsConstants.baseUrl,
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

  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
