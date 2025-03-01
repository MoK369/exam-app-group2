import 'package:exam_app_group2/core/api/api_result/api_result.dart';


abstract class ForgetPasswordRepo 
{
  Future<ApiResult<void>> forgetPassword({
    required String mail
  }) ;

}