import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/verification_response_entity.dart';

abstract class VerifyCodeRemoteDatasource {
  Future<ApiResult<VerificationResponseEntity>> verifyCode(String code);
}