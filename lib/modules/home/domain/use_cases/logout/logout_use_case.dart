import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout_and_delete/logout_delete_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/logout/logout_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final LogoutRepository _logoutRepository;

  LogoutUseCase(this._logoutRepository);

  Future<ApiResult<LogoutAndDeleteEntity>> call() {
    return _logoutRepository.logout();
  }
}
