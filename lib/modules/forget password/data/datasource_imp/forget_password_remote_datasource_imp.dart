import 'package:exam_app_group2/core/api/api_excuter/api_excuter.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/data/api/api_manager.dart';

import 'package:exam_app_group2/modules/forget%20password/data/datasource_contract/forget_password_remote_datasource.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/forget_password_response.dart';
import 'package:injectable/injectable.dart';

@Injectable( as : ForgetPasswordRemoteDatasource)
class ForgetPasswordRemoteDatasourceImp  implements ForgetPasswordRemoteDatasource{
    ForgotPasswordApiManager apiManager ; 
  ForgetPasswordRemoteDatasourceImp({required this.apiManager});
  @override
  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(String email) async {
    return ApiExecutor.executeApi<ForgotPasswordResponse>(()async {
      var forgetPasswordReponse = await apiManager.forgotPassword(email: email);
      return  forgetPasswordReponse ;

    });
  }
}