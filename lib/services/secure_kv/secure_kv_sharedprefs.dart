import 'package:injectable/injectable.dart';
import 'package:passwd/services/secure_kv/secure_kv.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Environment("desktop")
@LazySingleton(as: SecureKVService)
class SecureKVSecureStorage implements SecureKVService {
  SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<String> getValue(String key) async {
    if (preferences == null) {
      await init();
    }

    return preferences.getString(key);
  }

  @override
  Future putValue(String key, String value) async {
    if (preferences == null) {
      await init();
    }

    return await preferences.setString(key, value);
  }
}
