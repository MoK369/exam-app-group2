import 'package:dio/dio.dart';
import 'package:exam_app_group2/core/di/injectable_initializer.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeApiManager {
  late final Dio _dio;

  HomeApiManager() {
    _dio = getIt.get<Dio>();
  }
}
