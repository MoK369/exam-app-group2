import 'package:exam_app_group2/modules/home/domain/use_cases/login_info_use_case/delete_login_info_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel {
  DeleteLoginInfoUseCase _deleteLoginInfoUseCase;

  HomeViewModel(this._deleteLoginInfoUseCase);

  void deleteLoginInfo() async {
    return await _deleteLoginInfoUseCase.invoke();
  }
}
