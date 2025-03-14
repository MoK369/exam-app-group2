import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/change_password/data/models/change_password/request/change_password_request_model.dart';
import 'package:exam_app_group2/modules/change_password/data/models/change_password/response/change_password_response_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'change_password_api_client.g.dart';

@RestApi()
abstract interface class ChangePasswordApiClient {
  factory ChangePasswordApiClient(Dio dio) = _ChangePasswordApiClient;

  @PATCH('api/v1/auth/changePassword')
  Future<ChangePasswordResponseDto> changePassword(
      @Body() ChangePasswordRequestModel changePasswordRequestModel);
}
