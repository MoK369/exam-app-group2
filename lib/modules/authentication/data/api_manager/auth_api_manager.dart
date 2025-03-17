import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/apis_endpoints/apis_endpoints.dart';
import 'package:exam_app_group2/modules/authentication/data/model/forget_password_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/data/model/reset_password_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/data/model/verification_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/data/models/authentication/response/authentication_response.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/injectable_initializer.dart';
import '../models/login/login_request.dart';

@lazySingleton
class AuthApiManager {
  late final Dio _dio;

  AuthApiManager() {
    _dio = getIt.get<Dio>();
  }

  Future<AuthenticationResponseDto> signUp(
      {required SignUpRequestParameters signUpParameters}) async {
    Response response =
        await _dio.post(ApisEndpoints.signUp, data: signUpParameters.toJson());

    AuthenticationResponseDto authenticationResponse =
        AuthenticationResponseDto.fromJson(response.data);
    //authenticationResponse.message = 23 as String;
    return authenticationResponse;
  }

  Future<AuthenticationResponseDto> login({
    required LoginRequest loginRequest,
  }) async {
    var result = await _dio.post(
      ApisEndpoints.login,
      data: loginRequest.toJson(),
    );

    return AuthenticationResponseDto.fromJson(result.data);
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

  Future<ResetPasswordResponseDto> resetPassword(
      {required String mail, required String newPassword}) async {
    var result = await _dio.put(ApisEndpoints.resetPasswordEndPoint,
        data: {'email': mail, 'newPassword': newPassword});

    return ResetPasswordResponseDto.fromJson(result.data);
  }
}
