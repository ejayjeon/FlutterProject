import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';

class AppLayout extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool needDrawer;
  final bool needActionButton;
  final bool needBottomNavigationBar;
  final Drawer? drawer;
  final BottomNavigationBar? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final VoidCallback? onSearchPressed;

  const AppLayout({
    super.key,
    this.title,
    this.needDrawer = false,
    this.needBottomNavigationBar = true,
    this.needActionButton = true,
    required this.body,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: _appBar(),
      drawer: !needDrawer ? drawer : null,
      drawerEnableOpenDragGesture: false,
      body: body,
      // bottomNavigationBar: bottomNavigationBar,
      bottomNavigationBar: _bottomNavigationBar(controller),
      floatingActionButton: floatingActionButton,
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
      actions: needActionButton
          ? [
              IconButton(
                onPressed: onSearchPressed,
                icon: const Icon(
                  Icons.search_sharp,
                ),
              ),
            ]
          : null,
    );
  }

  BottomNavigationBar? _bottomNavigationBar(AppController controller) {
    if (!needBottomNavigationBar) return null;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor:
          Get.isDarkMode ? lightTheme.primaryColor : darkTheme.primaryColor,
      unselectedItemColor:
          Get.isDarkMode ? lightTheme.disabledColor : darkTheme.disabledColor,
      onTap: (int index) {
        // controller.tabcontroller.animateTo(index);
        if (index == 0) {
          Get.toNamed(Routes.HOME);
        } else if (index == 1) {
          Get.toNamed(Routes.BOOK);
        } else if (index == 2) {
          Get.toNamed(Routes.INTRO);
        } else {
          Get.toNamed(Routes.SETTING);
        }
      },
      currentIndex: getIndex(),
      items: List.generate(
        controller.tabItems.length,
        (index) => _bottomNavItem(
          iconPath: controller.tabItems[index]['icon'],
          activeIconPath: controller.tabItems[index]['icon'],
          label: controller.tabItems[index]['label'],
          isActive: getIndex() == index,
        ),
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  BottomNavigationBarItem _bottomNavItem({
    required String iconPath,
    required String activeIconPath,
    required String label,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        fit: BoxFit.cover,
        width: 23.w,
        color: Colors.grey,
      ),
      activeIcon: SvgPicture.asset(
        activeIconPath,
        fit: BoxFit.cover,
        width: 23.w,
        color:
            Get.isDarkMode ? lightTheme.primaryColor : darkTheme.primaryColor,
      ),
      label: label,
    );
  }

  int getIndex() {
    if (Get.currentRoute == Routes.HOME) {
      return 0;
    } else if (Get.currentRoute == Routes.BOOK) {
      return 1;
    } else if (Get.currentRoute == Routes.INTRO) {
      return 2;
    } else {
      return 3;
    }
  }
}
