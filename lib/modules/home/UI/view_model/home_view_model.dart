import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/api/apis_endpoints/apis_endpoints.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  void updateDioWithToken(String token) {
    Dio dio = getIt.get<Dio>();
    BaseOptions newBaseOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        baseUrl: ApisEndpoints.baseUrl,
        headers: {"token": token});
    dio.options = newBaseOptions;
  }
}
