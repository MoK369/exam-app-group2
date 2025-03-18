import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/home/data/api/api_client/home_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HomeApiClientProvider {
  @singleton
  HomeApiClient provideApiClient(Dio dio) {
    return HomeApiClient(dio);
  }
}
