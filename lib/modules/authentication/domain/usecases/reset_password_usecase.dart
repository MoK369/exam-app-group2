import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/domain/entity/reset_password_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repo_contract/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUseCase({required this.resetPasswordRepo});

  Future<ApiResult<ResetPasswordResponseEntity>> invoke(
      String mail, String newPassword) {
    return resetPasswordRepo.resetPassword(mail: mail, newPassword: newPassword);
  }
}
