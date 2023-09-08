import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whoever/app/common/util/theme.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/home/home_view.dart';
import 'package:whoever/app/splash/splash_view.dart';

class AppController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;
  final RxBool isLight = false.obs;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() async {
    super.onInit();
    Log('[AppController] init...');
    tabController = TabController(
      length: tabViews.length,
      vsync: this,
    );
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // 1. App Tab UI
  final List<Widget> tabViews = <Widget>[
    const SplashView(),
    const HomeView(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  // 2. App Theme

  setThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isLight.value);
  }

  getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    isLight.value = (await _isLight.value);
    // Get.changeTheme(
    //   isLight.value ? darkTheme : lightTheme,
    // );
    Get.changeThemeMode(
      isLight.value ? ThemeMode.light : ThemeMode.dark,
    );
  }

  // 3. App Access / Refresh Token
}
