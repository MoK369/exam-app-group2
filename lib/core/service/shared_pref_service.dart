import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPrefServiceModule {
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
