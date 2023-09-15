import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/util/utils.dart';

class App extends GetView<AppController> {
  final bool needStartDrawer;
  final bool needBottomNavigationBar;

  const App({
    super.key,
    this.needStartDrawer = true,
    this.needBottomNavigationBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppLayout(
        drawer: _startDrawer(),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.tabcontroller,
          children: controller.tabViews,
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Drawer? _startDrawer() {
    if (!needStartDrawer) return null;
    return Drawer(
      width: Get.width * 0.9,
    );
  }

  BottomNavigationBar? _bottomNavigationBar() {
    if (!needBottomNavigationBar) return null;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        controller.tabcontroller.animateTo(index);
      },
      currentIndex: controller.currentIndex.value,
      items: List.generate(
        controller.tabViews.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(
            controller.tabItems[index]['icon'],
          ),
          label: controller.tabItems[index]['label'],
        ),
      ),
    );
  }
}
