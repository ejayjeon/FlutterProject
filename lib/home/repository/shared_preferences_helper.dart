import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _selectedIconKey = 'selectedIcon';

  static Future<SharedPreferences> _getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<String> getSelectedIcon() async {
    SharedPreferences prefs = await _getSharedPreferencesInstance();
    return prefs.getString(_selectedIconKey) ?? '';
  }

  static Future<void> setSelectedIcon(String icon) async {
    SharedPreferences prefs = await _getSharedPreferencesInstance();
    await prefs.setString(_selectedIconKey, icon);
  }
}
