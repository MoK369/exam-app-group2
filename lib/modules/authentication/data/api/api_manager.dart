import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:exam_app_group2/core/di/register_module.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/User_dm.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_request.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_endPoints.dart';

@singleton
@injectable
class ApiManager {
  final Dio dio;

  ApiManager({
    required this.dio,
  });

  Future<LoginResponse> login({
    required LoginRequest loginRequest,
  }) async {
    var result = await dio.post(
      EndPointsConstants.loginEndPoint,
      data: loginRequest.toJson(),
    );

    return LoginResponse.fromJson(result.data);
  }
}
