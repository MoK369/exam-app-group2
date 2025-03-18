import 'package:exam_app_group2/core/api/api_excuter/api_excuter.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/api_manager/auth_api_manager.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/reset_password_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/model/reset_password_response_dto.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/reset_password_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDatasourceImp
    implements ResetPasswordRemoteDataSource {
  final AuthApiManager apiManager;

  ResetPasswordRemoteDatasourceImp({required this.apiManager});

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      String email, String newPassword) async {
    var apiResult = await ApiExecutor.executeApi<ResetPasswordResponseDto>(() {
      return apiManager.resetPassword(mail: email, newPassword: newPassword);
    });
    switch (apiResult) {
      case Success<ResetPasswordResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<ResetPasswordResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
