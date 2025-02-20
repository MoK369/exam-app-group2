import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/apis_endpoints/apis_endpoints.dart';
import 'package:exam_app_group2/di/injectable_initializer.dart';
import 'package:exam_app_group2/dio_service/dio_service.dart';
import 'package:exam_app_group2/modules/authentication/data/models/authentication/response/authentication_response.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiManager {
  late final Dio _dio;

  ApiManager() {
    _dio = getIt.get<Dio>();
  }

  Future<AuthenticationResponseDto> signUp(
      {required SignUpRequestParameters signUpParameters}) async {
    Response response = await _dio.post(ApisEndpoints.signUpEndpoint,
        data: signUpParameters.toJson());

    AuthenticationResponseDto authenticationResponse =
        AuthenticationResponseDto.fromJson(response);
    //authenticationResponse.message = 23 as String;
    return authenticationResponse;
  }
}
