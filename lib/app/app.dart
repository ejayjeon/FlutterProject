import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';

class App extends GetView<AppController> {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Get.currentRoute.toString()),
      ),
      body: TabBarView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: controller.tabController,
        children: controller.tabViews,
      ),
    );
  }
}
