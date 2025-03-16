import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/forget%20password/domain/repo_contract/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUsecase {
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUsecase({required this.resetPasswordRepo});

  Future<ApiResult<void>> invoke(String mail, String newPassword) {
    return resetPasswordRepo.resetPassword(mail: mail, newPassword: newPassword);
  }
}
