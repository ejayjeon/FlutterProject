import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/theme/color_schemes.g.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';

class AppLayout extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool needDrawer;
  final bool needActionButton;
  final bool needBottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final VoidCallback? onSearchPressed;

  const AppLayout({
    super.key,
    this.title,
    this.needDrawer = false,
    this.needBottomNavigationBar = false,
    this.needActionButton = true,
    required this.body,
    this.floatingActionButton,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: _appBar(),
        drawer: _startDrawer(controller),
        drawerEnableOpenDragGesture: false,
        body: body,
        bottomNavigationBar: _bottomNavigationBar(controller),
        floatingActionButton: floatingActionButton,
      ),
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

  Drawer? _startDrawer(AppController controller) {
    if (!needDrawer) return null;
    return Drawer(
      width: Get.width * 0.8,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
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

  BottomNavigationBar? _bottomNavigationBar(AppController controller) {
    if (!needBottomNavigationBar) return null;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor:
          Get.isDarkMode ? lightTheme.primaryColor : darkTheme.primaryColor,
      unselectedItemColor:
          Get.isDarkMode ? lightTheme.disabledColor : darkTheme.disabledColor,
      onTap: (int index) {
        if (index == controller.tabItems[index]['index']) {
          Get.offAndToNamed(controller.tabItems[index]['routeName']);
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

  /**
   * 바텀 네비게이션 움직일 때마다 인덱스 변동
   */
  int getIndex() {
    if (Get.currentRoute == Routes.HOME) {
      return 0;
    } else if (Get.currentRoute == Routes.BOOK) {
      return 1;
    } else if (Get.currentRoute == Routes.CHAT) {
      return 2;
    } else {
      return 3;
    }
  }
}
