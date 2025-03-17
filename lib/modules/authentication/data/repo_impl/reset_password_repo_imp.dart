import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/reset_password_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/reset_password_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImp implements ResetPasswordRepo {
  final ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;

  @factoryMethod
  ResetPasswordRepoImp({
    required this.resetPasswordRemoteDataSource,
  });

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword({
    required String mail,
    required String newPassword,
  }) async {
    return resetPasswordRemoteDataSource.resetPassword(mail, newPassword);
  }
}
