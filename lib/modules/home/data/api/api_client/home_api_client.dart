import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/home/data/models/logout_and_delete/logout_and_delete_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@RestApi()
abstract class HomeApiClient {
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET('api/v1/auth/logout')
  Future<LogoutAndDeleteResponseDto> logout();

  @DELETE('api/v1/auth/deleteMe')
  Future<LogoutAndDeleteResponseDto> deleteAccount();
}
