import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ""));

  Dio get getDio => _dio;
}
