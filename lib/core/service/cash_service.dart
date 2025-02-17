import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CashService {
  Future<void> setString(String key, String value);

  Future<String?> getString(String key);
}

@Injectable(as: CashService)
@singleton
class CashServiceImpl extends CashService {
  SharedPreferences sharedPreferences;

  @factoryMethod
  CashServiceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<String?> getString(String key) {
    return Future.value(sharedPreferences.getString(key));
  }

  @override
  Future<void> setString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }
}
