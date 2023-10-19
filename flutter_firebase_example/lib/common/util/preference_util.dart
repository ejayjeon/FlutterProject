import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  static SharedPreferences? _instance;

  static Future<SharedPreferences> init() async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  static Future<void> setValue(String key, String value) async {
    await _instance!.setString(key, value);
  }

  static Future<String?> getValue(String key, String? value) async {
    return _instance!.getString(key) ?? value;
  }
  // static SharedPreferences? _prefInstance;
  // Future<SharedPreferences> get _instance async =>
  //     _prefInstance ??= await SharedPreferences.getInstance();
  // late final SharedPreferences _prefInstance;
  // Future<SharedPreferences> get _instance async =>
  //     _prefInstance ??= await SharedPreferences.getInstance();

  // Future<SharedPreferences> init() async {
  //   _prefInstance = await _instance;
  //   return _prefInstance!;
  // }

  // static String getString(String key, [String? value]) {
  //   return _prefInstance!.getString(key) ?? value ?? "";
  // }

  // static Future<bool> setString(String key, String value) {
  //   return _prefInstance?.setString(key, value) ?? Future.value(false);
  // }
}
