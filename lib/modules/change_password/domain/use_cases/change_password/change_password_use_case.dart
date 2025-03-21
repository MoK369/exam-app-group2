import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/request/change_password_request_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/entities/change_password/response/change_password_response_entity.dart';
import 'package:exam_app_group2/modules/change_password/domain/repositories_contracts/change_password/change_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  ChangePasswordRepository changePasswordRepository;

  ChangePasswordUseCase(this.changePasswordRepository);

  Future<ApiResult<ChangePasswordResponseEntity>> call(
      ChangePasswordRequestEntity requestEntity) async {
    return await changePasswordRepository.changePassword(requestEntity);
  }
}
