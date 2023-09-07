import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/view/home/home_view.dart';
import 'package:whoever/app/view/splash/splash_view.dart';

class AppController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void onInit() {
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

  // 2. App Device Token

  // 3. App Access / Refresh Token
}
