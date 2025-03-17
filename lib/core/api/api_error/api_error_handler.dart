import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/api_error/api_error_model.dart';
import 'package:exam_app_group2/core/custom_exception/old_password_same_as_new_password.dart';
import 'package:exam_app_group2/core/custom_exception/profile_not_changed_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ApiErrorHandler {
  static ApiErrorHandler? _instance;
  late AppLocalizations appLocalizations;

  ApiErrorHandler._init(this.appLocalizations);

  static ApiErrorHandler getInstance(AppLocalizations appLocalizations) {
    if (_instance == null) {
      _instance = ApiErrorHandler._init(appLocalizations);
    } else {
      _instance!.appLocalizations = appLocalizations;
    }
    return _instance!;
  }

  ApiErrorModel handle(Object error) {
    if (error is ProfileNotChangeException) {
      return ApiErrorModel(message: appLocalizations.profileNotChangeMessage);
    }
    if (error is OldPasswordSameAsNewPassword) {
      return ApiErrorModel(
          message: appLocalizations.oldPasswordSameAsNewPassword);
    }
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: appLocalizations.connectionTimeout);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: appLocalizations.sendTimeout);
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: appLocalizations.receiveTimeout);
        case DioExceptionType.badResponse:
          return ApiErrorModel.fromJson(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: appLocalizations.cancel);
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: appLocalizations.connectionError);
        case DioExceptionType.unknown:
          return ApiErrorModel(message: appLocalizations.unknown);
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: appLocalizations.badCertificate);
        default:
          return ApiErrorModel(message: appLocalizations.somethingWentWrong);
      }
    } else {
      log(error.toString());
      return ApiErrorModel(message: error.toString());
    }
  }
}