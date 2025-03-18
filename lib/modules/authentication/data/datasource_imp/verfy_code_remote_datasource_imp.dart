import 'package:exam_app_group2/core/api/api_excuter/api_excuter.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/api_manager/auth_api_manager.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/verfy_code_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/model/verification_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/verification_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyCodeRemoteDatasource)
class VerifyCodeRemoteDatasourceImp implements VerifyCodeRemoteDatasource {
  AuthApiManager apiManager;

  VerifyCodeRemoteDatasourceImp({required this.apiManager});

  @override
  Future<ApiResult<VerificationResponseEntity>> verifyCode(String code) async {
    var apiResult =
        await ApiExecutor.executeApi<VerificationResponseDto>(() async {
      var verifyCodeResponse = await apiManager.verifyCode(code: code);
      return verifyCodeResponse;
    });
    switch (apiResult) {
      case Success<VerificationResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<VerificationResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
