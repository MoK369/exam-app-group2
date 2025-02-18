import 'package:dio/dio.dart';
import 'package:exam_app_group2/dio_service/dio_service.dart';
import 'package:injectable/injectable.dart';

@injectable

class ApiManager {
  DioService dioService;
  ApiManager(this.dioService);
  void login() {
  }
}
