import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';

class ThemeController extends GetxController {
  RxBool on = false.obs;

  void toggle() {
    on.value = on.value ? false : true;
    Get.changeThemeMode(
      on.value ? ThemeMode.dark : ThemeMode.light,
    );
    Get.changeTheme(on.value ? darkTheme : lightTheme);
  }
}
