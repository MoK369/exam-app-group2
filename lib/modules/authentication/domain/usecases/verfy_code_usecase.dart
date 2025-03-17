import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/verification_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/verfy_code_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseSase {
  VerifyCodeRepo verifyCodeRepo;

  VerifyCodeUseSase({required this.verifyCodeRepo});

  Future<ApiResult<VerificationResponseEntity>> invoke(String code) {
    return verifyCodeRepo.verifyCode(code: code);
  }

}