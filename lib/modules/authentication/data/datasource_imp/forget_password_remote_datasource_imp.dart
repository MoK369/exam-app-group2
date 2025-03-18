import 'package:exam_app_group2/core/api/api_excuter/api_excuter.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/api_manager/auth_api_manager.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/forget_password_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/model/forget_password_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/forget_password_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRemoteDatasource)
class ForgetPasswordRemoteDatasourceImp
    implements ForgetPasswordRemoteDatasource {
  AuthApiManager apiManager;

  ForgetPasswordRemoteDatasourceImp({required this.apiManager});

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgotPassword(
      String email) async {
    var apiResult =
        await ApiExecutor.executeApi<ForgetPasswordResponseDto>(() async {
      var forgetPasswordResponse =
          await apiManager.forgotPassword(email: email);
      return forgetPasswordResponse;
    });
    switch (apiResult) {
      case Success<ForgetPasswordResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<ForgetPasswordResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
