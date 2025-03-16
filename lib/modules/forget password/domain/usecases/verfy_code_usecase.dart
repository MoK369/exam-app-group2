import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/repo_contract/verfy_code_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerfyCodeUsecase {

  VerfyCodeRepo verfyCodeRepo ; 
  VerfyCodeUsecase({required this.verfyCodeRepo});

  Future<ApiResult<void>> invoke ( String code)
  {
    return verfyCodeRepo.verfyCode(code: code);

  }

}