import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/home/data/models/logout/logout_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@RestApi()
abstract class HomeApiClient {
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET('api/v1/auth/logout')
  Future<LogoutResponseDto> logout();
}
