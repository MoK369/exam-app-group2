import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:exam_app_group2/core/utils/api_endpoints.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/forget_password_response.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/reset_password_response.dart';
import 'package:injectable/injectable.dart';


@singleton
@injectable
class ForgotPasswordApiManager {
  late final Dio _dio  ;

  ForgotPasswordApiManager(){
    _dio = getIt.get<Dio>();
  }

  Future<ForgotPasswordResponse> forgotPassword({
    required String email,
  }) async {
    var result = await _dio.post(
      ApiEndPoints.forgetPasswordEndPoint,
      data: {
        'email': email,
      },
    );


    return ForgotPasswordResponse.fromJson(result.data);
  }

  Future<ForgotPasswordResponse> verfyCode({required String code}) async 
  {
    var result = await _dio.post(
      ApiEndPoints.verfyCodeEndPoint,
      data: 
      {
        'resetCode' : code
      }
      
    );

    return ForgotPasswordResponse.fromJson(result.data);



  }
  Future<ResetPasswordResponse> resetPassword({required String mail , required String newPassword}) async 
  {
    log("inside api manager");
    log(mail);
    log(newPassword);
    var result = await _dio.put(
      ApiEndPoints.resetPasswordEndPoint , 
      data: 
      {
        'email':mail,
        'newPassword': newPassword
      }
    );
    print(result.data);
    print(result.statusCode);
    print(result.statusMessage);
    log("b3d el post");

     return ResetPasswordResponse.fromJson(result.data);

  }
}
