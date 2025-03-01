import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/data/datasource_contract/reset_password_remote_datasource.dart';
import 'package:exam_app_group2/modules/forget%20password/data/model/reset_password_response.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/repo_contract/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImp implements ResetPasswordRepo {
  final ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;

  @factoryMethod
  ResetPasswordRepoImp({
    required this.resetPasswordRemoteDataSource,
  });

  @override
  Future<ApiResult<void>> resetPassword({
    required String mail,
    required String newPassword,
  }) async {
    var result = await resetPasswordRemoteDataSource.resetPassword(mail, newPassword);

    switch (result) {
      case Success<ResetPasswordResponse>():
        break;
      case Error<ResetPasswordResponse>():
        break;
    }

    return result;
  }
}
