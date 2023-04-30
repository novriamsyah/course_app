import 'package:e_learning_app/common/values/contant_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _prefs;

  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();

    return this;
  }

  //storage save cek onboarding get started
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(ConstanValueApp.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }

  //storage save user login
  Future<bool> setCheckLogin(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getStorageUserLogged() {
    return _prefs.getString(ConstanValueApp.STORAGE_USER_LOGGED_TOKEN) == null
        ? false
        : true;
  }

  Future<bool> setLogout(String key) async {
    return await _prefs.remove(key);
  }
}
