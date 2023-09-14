import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/view/home_view.dart';
import 'package:whoever/app/view/intro_view.dart';
import 'package:whoever/app/view/setting_view.dart';

class AppController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabcontroller;
  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabcontroller = TabController(
      length: tabItems.length,
      vsync: this,
    );
    // tabcontroller.addListener(tabListener);
  }

  @override
  void onClose() {
    // tabcontroller.removeListener(tabListener);
    tabcontroller.dispose();
    super.onClose();
  }

  // void tabListener() {
  //   currentIndex.value = tabcontroller.index;
  // }

  final List<Widget> tabViews = <Widget>[
    const IntroView(),
    const HomeView(),
    const SettingView(),
  ];

  final List<Map<String, dynamic>> tabItems = [
    {
      'icon': Icons.dark_mode_outlined,
      'label': 'Intro'.tr,
    },
    {
      'icon': Icons.home_outlined,
      'label': 'Home'.tr,
    },
    {
      'icon': Icons.settings,
      'label': 'Setting'.tr,
    },
  ];
}
