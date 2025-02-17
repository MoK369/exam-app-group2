import 'dart:convert';

import 'package:exam_app_group2/modules/authentication/data/datasource_contract/auth_local_datasource.dart';
import 'package:exam_app_group2/modules/authentication/data/model/login/user_dm.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/service/cash_service.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  CashService cashService;

  @factoryMethod
  AuthLocalDataSourceImpl({required this.cashService});

  @override
  Future<String?> getCashedUser() async {
    final token = await cashService.getString('token');
    return token;
  }

  @override
  Future<void> cashUser({
    required UserDM? user,
    required String? token,
  }) {
    cashService.setString('token', token ?? '');
    return cashService.setString('user_key', jsonEncode(user?.toJson()));
  }
}
