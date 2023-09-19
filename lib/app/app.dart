import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/theme/color_schemes.g.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';

class App extends GetView<AppController> {
  final bool needStartDrawer;
  final bool needBottomNavigationBar;

  App({
    super.key,
    this.needStartDrawer = true,
    this.needBottomNavigationBar = true,
  }) {
    controller.getThemeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AppLayout(
          // title: Routes.HOME.replaceAll(RegExp('/'), '').toUpperCase(),
          onSearchPressed: () {
            controller.isDark.value = !controller.isDark.value;
            Get.changeThemeMode(
              controller.isDark.value ? ThemeMode.light : ThemeMode.dark,
            );
          },
          needDrawer: true,
          needActionButton: true,
          drawer: _startDrawer(),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.tabcontroller,
            children: controller.tabViews,
          ),
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ),
    );
  }

  Drawer? _startDrawer() {
    if (!needStartDrawer) return null;
    return Drawer(
      width: Get.width * 0.8,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/image/illu16.png',
              ),
            ),
            accountName: Text('Ejayjeon'),
            accountEmail: Text('ejayjeon@gmail.com'),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
              color: Get.isDarkMode
                  ? darkColorScheme.onPrimary
                  : lightColorScheme.onPrimary,
            ),
          ),
          ...List.generate(
            controller.drawerItems.length,
            (index) => ListTile(
              leading: SvgPicture.asset(
                controller.drawerItems[index]['icon'],
                fit: BoxFit.cover,
                width: 20.w,
                color: Colors.grey,
              ),
              title: Text(controller.drawerItems[index]['title']),
              onTap: () {
                Get.toNamed(controller.drawerItems[index]['to']);
              },
              trailing: Icon(Icons.navigate_next_outlined),
            ),
          )
        ],
      ),
    );
  }

  BottomNavigationBar? _bottomNavigationBar() {
    if (!needBottomNavigationBar) return null;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor:
          Get.isDarkMode ? lightTheme.primaryColor : darkTheme.primaryColor,
      unselectedItemColor:
          Get.isDarkMode ? lightTheme.disabledColor : darkTheme.disabledColor,
      onTap: (int index) {
        controller.tabcontroller.animateTo(index);
      },
      currentIndex: controller.currentIndex.value,
      items: List.generate(
        controller.tabViews.length,
        (index) => BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            controller.tabItems[index]['icon'],
            fit: BoxFit.cover,
            width: 23.w,
            color: Get.isDarkMode
                ? lightTheme.primaryColor
                : darkTheme.primaryColor,
          ),
          icon: SvgPicture.asset(
            controller.tabItems[index]['icon'],
            fit: BoxFit.cover,
            width: 23.w,
            color: Colors.grey,
          ),
          label: controller.tabItems[index]['label'],
        ),
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
