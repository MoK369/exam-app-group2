import 'package:exam_app_group2/core/api/api_excuter/api_excuter.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/data/api/api_manager.dart';
import 'package:exam_app_group2/modules/forget%20password/data/datasource_contract/reset_password_remote_datasource.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/reset_password_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDatasourceImp implements ResetPasswordRemoteDataSource {
  final ForgotPasswordApiManager apiManager;

  ResetPasswordRemoteDatasourceImp({required this.apiManager});

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword(String email, String newPassword) async {
    return ApiExecutor.executeApi<ResetPasswordResponse>(() async {
      var resetPasswordResponse = await apiManager.resetPassword(mail: email, newPassword: newPassword);
      print(resetPasswordResponse.message);
      print(resetPasswordResponse.token);
      return resetPasswordResponse;
    });
  }
}
