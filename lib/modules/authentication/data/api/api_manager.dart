import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/apis_endpoints/apis_endpoints.dart';

import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/authentication/data/model/forget_password_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/data/model/reset_password_response.dart';
import 'package:exam_app_group2/modules/authentication/data/model/verification_response_dto.dart';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class ForgotPasswordApiManager {
  late final Dio _dio;

  ForgotPasswordApiManager() {
    _dio = getIt.get<Dio>();
  }

  Future<ForgetPasswordResponseDto> forgotPassword({
    required String email,
  }) async {
    var result = await _dio.post(
      ApisEndpoints.forgetPasswordEndPoint,
      data: {
        'email': email,
      },
    );

    return ForgetPasswordResponseDto.fromJson(result.data);
  }

  Future<VerificationResponseDto> verifyCode({required String code}) async {
    var result = await _dio
        .post(ApisEndpoints.verifyCodeEndPoint, data: {'resetCode': code});

    return VerificationResponseDto.fromJson(result.data);
  }

  Future<ResetPasswordResponse> resetPassword(
      {required String mail, required String newPassword}) async {
    log("inside api manager");
    log(mail);
    log(newPassword);
    var result = await _dio.put(ApisEndpoints.resetPasswordEndPoint,
        data: {'email': mail, 'newPassword': newPassword});
    print(result.data);
    print(result.statusCode);
    print(result.statusMessage);
    log("b3d el post");

    return ResetPasswordResponse.fromJson(result.data);
  }
}
