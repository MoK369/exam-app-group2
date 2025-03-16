import 'package:exam_app_group2/core/api/api_excuter/api_excuter.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/data/api/api_manager.dart';
import 'package:exam_app_group2/modules/forget%20password/data/datasource_contract/verfy_code_remote_datasource.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/forget_password_response.dart';
import 'package:injectable/injectable.dart';


@Injectable( as : VerfyCodeRemoteDatasource)
class VerfyCodeRemoteDatasourceImp  implements VerfyCodeRemoteDatasource{
  ForgotPasswordApiManager apiManager ; 
  VerfyCodeRemoteDatasourceImp({required this.apiManager});

  
  @override
  Future<ApiResult<ForgotPasswordResponse>> verfyCode(String code) async
  {

    return ApiExecutor.executeApi<ForgotPasswordResponse>(() async {
      var verfyCodeResponse =  await apiManager.verfyCode(code: code);
      return verfyCodeResponse ; 
    });
  
  }
}