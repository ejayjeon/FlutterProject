import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  static HomeController get homeCtrl => Get.find();
  RxInt homePageIndex = 0.obs;
  RxBool isPageOpen = false.obs;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  

  void changeHomePageIndex(int index) {
    homePageIndex(index);
  }

Future<bool> onWillPop() async {
  setCategoryPage(false);
  return !await navigatorKey.currentState!.maybePop();
}

void setCategoryPage(bool ck) {
  isPageOpen(ck);
}

void goBack(){
  setCategoryPage(false);
  onWillPop();
}


}

