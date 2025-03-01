import 'package:exam_app_group2/core/api/api_result/api_result.dart';


abstract class VerfyCodeRepo {

  Future<ApiResult<void>> verfyCode(
    {
      required String code
    }
  );
}