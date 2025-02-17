import 'package:exam_app_group2/modules/authentication/domain/entity/user_entity.dart';

import '../../../../core/utils/result.dart';
import '../../data/model/login/login_request.dart';

abstract class AuthRepo {
  Future<Result<void>> login({
    required LoginRequest loginRequest,
  });
}
