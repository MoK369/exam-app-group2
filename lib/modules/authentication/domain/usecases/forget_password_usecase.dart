import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/forget_password_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/forget_password_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepo forgetPasswordRepo;

  ForgetPasswordUseCase({required this.forgetPasswordRepo});

  Future<ApiResult<ForgetPasswordResponseEntity>> invoke(String mail) {
    return forgetPasswordRepo.forgetPassword(mail: mail);
  }
}
