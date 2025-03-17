import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/domain/entities/get_logged_user_info/logged_user_info_entity.dart';

abstract interface class LoggedUserInfoRepository {
  Future<ApiResult<LoggedUserInfoEntity>> getLoggedUserInfo();
}
