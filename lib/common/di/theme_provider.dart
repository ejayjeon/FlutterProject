import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<bool> {
  late SharedPreferences _instance;

  ThemeNotifier() : super(false) {
    _init();
  }

  void toggle() {
    state = !state;
    _instance.setBool("darkMode", state);
  }

  Future _init() async {
    _instance = await SharedPreferences.getInstance();

    var darkMode = _instance.getBool("darkMode");
    state = darkMode ?? false;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(),
);
