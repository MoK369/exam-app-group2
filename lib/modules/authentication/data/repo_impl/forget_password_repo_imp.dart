import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/datasource_contract/forget_password_remote_datasource.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/forget_password_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImp implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDatasource forgetPasswordRemoteDatasource;

  @factoryMethod
  ForgetPasswordRepoImp({
    required this.forgetPasswordRemoteDatasource,
  });

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword({
    required String mail,
  }) {
    return forgetPasswordRemoteDatasource.forgotPassword(mail);
  }
}
