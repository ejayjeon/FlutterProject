import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/pref_service.dart';
import 'package:whoever/app/view/home_view.dart';
import 'package:whoever/app/view/intro_view.dart';
import 'package:whoever/app/view/setting_view.dart';

class AppController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // ------------ Field ------------------------
  late final TabController tabcontroller;
  final RxInt currentIndex = 0.obs;
  final RxBool isDark = false.obs;

  // -------------- Method -----------------------
  @override
  void onInit() {
    super.onInit();
    tabcontroller = TabController(
      length: tabItems.length,
      vsync: this,
    );
    tabcontroller.addListener(tabListener);
  }

  @override
  void onClose() {
    tabcontroller.removeListener(tabListener);
    tabcontroller.dispose();
    super.onClose();
  }

  void tabListener() {
    currentIndex.value = tabcontroller.index;
  }

  final List<Widget> tabViews = <Widget>[
    const HomeView(),
    const IntroView(),
    const SettingView(),
  ];

  final List<Map<String, dynamic>> tabItems = [
    {
      'icon': 'assets/icon/ic_home.png',
      'label': 'Home'.tr,
    },
    {
      'icon': 'assets/icon/ic_note.png',
      'label': 'Intro'.tr,
    },
    {
      'icon': 'assets/icon/ic_more.png',
      'label': 'Setting'.tr,
    },
  ];

  final List<Map<String, dynamic>> drawerItems = [
    {
      'icon': 'assets/icon/ic_home.png',
      'title': 'Home'.tr,
      'to': Routes.APP,
    },
    {
      'icon': 'assets/icon/ic_note.png',
      'title': 'Note'.tr,
      'to': Routes.APP,
    },
  ];

  // --------------------------------------------------------------------

  /**
   * APP THEME
   */
  setThemeStatus() async {
    await PrefManager.setData('isDarkMode', isDark.value);
  }

  getThemeStatus() async {
    final _isDark = await PrefManager.getData('isDarkMode') ?? true;
    isDark.value = _isDark;

    // Get.changeThemeMode(
    //   isDark.value ? ThemeMode.light : ThemeMode.dark,
    // );

    // Get.changeTheme(
    //   isDark.value ? lightTheme : darkTheme,
    // );
  }
}
