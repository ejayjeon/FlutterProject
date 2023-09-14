import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/view/home_view.dart';
import 'package:whoever/app/view/intro_view.dart';
import 'package:whoever/app/view/setting_view.dart';

class AppLayout extends GetView<AppController> {
  final String? title;
  final Widget body;
  final VoidCallback? onSearchPressed;
  final bool needStartDrawer;
  final bool needBottomNavigationBar;
  const AppLayout({
    super.key,
    this.title,
    required this.body,
    this.onSearchPressed,
    this.needStartDrawer = true,
    this.needBottomNavigationBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _startDrawer(),
      drawerEnableOpenDragGesture: false,
      // body: TabBarView(
      //   physics: const NeverScrollableScrollPhysics(),
      //   controller: controller.tabcontroller,
      //   children: [
      //     const IntroView(),
      //     const HomeView(),
      //     const SettingView(),
      //   ],
      // ),
      body: TabBarView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: controller.tabcontroller,
        children: controller.tabViews,
      ),
      // bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar? _appBar() {
    if (title == null) return null;
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onSearchPressed,
          icon: const Icon(
            Icons.search_sharp,
          ),
        ),
      ],
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
