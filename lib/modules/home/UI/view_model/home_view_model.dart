import 'package:exam_app_group2/dio_service/dio_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  void updateDioWithToken(String token) {
    DioService.updateDioWithToken(token);
  }
}
