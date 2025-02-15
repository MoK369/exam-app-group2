import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_constants.dart';

@singleton
class ApiManager {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
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

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await dio.post(
      AppConstants.loginEndPoint,
      data: LoginRequest(
        email: email,
        password: password,
      ).toJson(),
    );
  }
}
