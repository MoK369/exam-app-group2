import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/verfy_code_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/verification_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/verfy_code_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyCodeRepo)
class VerifyCodeRepoImp implements VerifyCodeRepo {
  final VerifyCodeRemoteDatasource verifyCodeRemoteDatasource;
  @factoryMethod
  VerifyCodeRepoImp({required this.verifyCodeRemoteDatasource});

  @override
  Future<ApiResult<VerificationResponseEntity>> verifyCode(
      {required String code}) async {
    return verifyCodeRemoteDatasource.verifyCode(code);
  }
}
