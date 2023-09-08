import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/common/util/theme.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/common/controller/app_controller.dart';

class App extends GetView<AppController> {
  App({super.key}) {
    Log('App init...');

    controller.getThemeStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Get.currentRoute.toString()),
        actions: [
          // ObxValue(
          //   (data) => Switch(
          //     value: controller.isLight.value,
          //     onChanged: (val) {
          //       controller.isLight.value = val;
          //       Get.changeTheme(
          //         controller.isLight.value ? lightTheme : darkTheme,
          //       );
          //     },
          //   ),
          //   false.obs,
          // ),
          IconButton(
            onPressed: () {
              controller.isLight.value = !controller.isLight.value;
              Get.changeThemeMode(
                controller.isLight.value ? ThemeMode.light : ThemeMode.dark,
              );
            },
            icon: Obx(
              () => Icon(
                controller.isLight.value ? Icons.mood : Icons.light,
              ),
            ),
          )
        ],
      ),
      body: TabBarView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: controller.tabController,
        children: controller.tabViews,
      ),
    );
  }
}
