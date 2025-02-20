import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/api_error/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout with the server');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: 'send timeout in connection with the server ');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: 'receive timeout in connection with the server ');
        case DioExceptionType.badResponse:
          return ApiErrorModel.fromJson(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Connect to server was canceled');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'Connection to server failed');
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  'Connection to server failed due to internet connection');
        default:
          return ApiErrorModel(message: 'something went wrong');
      }
    } else {
      log(error.toString());
      return ApiErrorModel(message: error.toString());
    }
  }

  // static ApiErrorModel _handleError(dynamic data) {
  //   return ApiErrorModel(
  //     message: data['message'],
  //     code: data['code'],
  //   );
  // }
}
