import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/authentication/data/model/authentication/response/authentication_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/login_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/api_end_points.dart';

@singleton
@injectable
class ApiManager {
  final Dio dio;

  ApiManager({
    required this.dio,
  });

  Future<AuthenticationResponseDto> login({
    required LoginRequest loginRequest,
  }) async {
    var result = await dio.post(
      ApiEndPoints.loginEndPoint,
      data: loginRequest.toJson(),
    );

    return AuthenticationResponseDto.fromJson(result.data);
  }
}
