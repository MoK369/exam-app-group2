import 'package:exam_app_group2/core/api/api_result/api_result.dart';

import 'package:exam_app_group2/modules/forget%20password/domain/repo_contract/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase {

  ForgetPasswordRepo forgetPasswordRepo ; 
  ForgetPasswordUsecase({ required this.forgetPasswordRepo});

  Future<ApiResult<void>> invoke(String mail)
  {
    return forgetPasswordRepo.forgetPassword(mail: mail);

  }
  
}