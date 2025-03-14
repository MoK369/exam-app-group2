import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/domain/entities/get_logged_user_info/logged_user_info_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/get_logged_user_info/logged_user_info_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserInfoUseCase {
  LoggedUserInfoRepository loggedUserInfoRepository;

  GetLoggedUserInfoUseCase(this.loggedUserInfoRepository);

  Future<ApiResult<LoggedUserInfoEntity>> call() {
    return loggedUserInfoRepository.getLoggedUserInfo();
  }
}
