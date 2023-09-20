import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/pref_service.dart';
import 'package:whoever/app/view/book_view.dart';
import 'package:whoever/app/view/home_view.dart';
import 'package:whoever/app/view/intro_view.dart';
import 'package:whoever/app/view/pin_view.dart';
import 'package:whoever/app/view/setting_view.dart';

class AppController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // ------------ Field ------------------------
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxBool isDark = false.obs;

  // -------------- Method -----------------------
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    scaffoldKey.currentState!.dispose();
    super.onClose();
  }

  final List<Map<String, dynamic>> tabItems = [
    {
      'index': 0,
      'icon': 'assets/icon/ic_home.svg',
      'label': 'Home'.tr,
      'routeName': Routes.HOME,
    },
    {
      'index': 1,
      'icon': 'assets/icon/ic_note.svg',
      'label': 'Book'.tr,
      'routeName': Routes.BOOK,
    },
    {
      'index': 2,
      'icon': 'assets/icon/ic_chat.svg',
      'label': 'Chat'.tr,
      'routeName': Routes.CHAT,
    },
    {
      'index': 3,
      'icon': 'assets/icon/ic_more.svg',
      'label': 'Setting'.tr,
      'routeName': Routes.SETTING,
    },
  ];

  final List<Map<String, dynamic>> drawerItems = [
    {
      'icon': 'assets/icon/ic_home.svg',
      'title': 'Home'.tr,
      'to': Routes.HOME,
    },
    {
      'icon': 'assets/icon/ic_note.svg',
      'title': 'Note'.tr,
      'to': Routes.HOME,
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
  }
}
