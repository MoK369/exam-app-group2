import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/data/datasource_contract/verfy_code_remote_datasource.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/forget_password_response.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/repo_contract/verfy_code_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable( as : VerfyCodeRepo )
class VerfyCodeRepoImp  implements VerfyCodeRepo{
  final VerfyCodeRemoteDatasource verfyCodeRemoteDatasource;
  @factoryMethod
  VerfyCodeRepoImp({required this.verfyCodeRemoteDatasource});
  @override
  Future<ApiResult<void>> verfyCode({required String code})  async {

    var result = await verfyCodeRemoteDatasource.verfyCode(code);

     switch (result) {
      case Success<ForgotPasswordResponse>():

        break;
      case Error<ForgotPasswordResponse>():
       
        break;
    }

    
    return result;
   
  }
}