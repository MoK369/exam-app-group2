import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/data/datasource_contract/forget_password_remote_datasource.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/forget_password_response.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/repo_contract/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImp implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDatasource forgetPasswordRemoteDatasource;

  @factoryMethod
  ForgetPasswordRepoImp({
    required this.forgetPasswordRemoteDatasource,
  });

  @override
  Future<ApiResult<void>> forgetPassword({
    required String mail,
  }) async {
    var result = await forgetPasswordRemoteDatasource.forgotPassword(mail);

    switch (result) {
      case Success<ForgotPasswordResponse>():

        break;
      case Error<ForgotPasswordResponse>():
       
        break;
    }

    return result;
  }
}
