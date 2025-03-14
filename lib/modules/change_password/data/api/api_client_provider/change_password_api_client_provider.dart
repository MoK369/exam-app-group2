import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/change_password/data/api/api_client/change_password_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ChangePasswordApiClientProvider {
  @factoryMethod
  ChangePasswordApiClient provideClient(Dio dio) {
    return ChangePasswordApiClient(dio);
  }
}
