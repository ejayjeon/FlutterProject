import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/theme/color_schemes.g.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/ui/widget/custom_dialog.dart';
import 'package:whoever/app/core/util/utils.dart';

class AppLayout extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool needDrawer;
  final bool needActionButton;
  final bool needBottomNavigationBar;
  final bool needFloatingActionButton;
  final FloatingActionButton? floatingActionButton;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onFabPressed;
  final String? fabToolTib;
  final Map<String, dynamic>? onWillpopSetting;

  const AppLayout({
    super.key,
    this.title,
    this.needDrawer = false,
    this.needBottomNavigationBar = false,
    this.needActionButton = true,
    this.needFloatingActionButton = false,
    required this.body,
    this.floatingActionButton,
    this.onSearchPressed,
    this.onFabPressed,
    this.fabToolTib,
    this.onWillpopSetting,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return WillPopScope(
      onWillPop: () async {
        FocusManager.instance.primaryFocus?.requestFocus(FocusNode());
        await showConfirmDialog(
          title: onWillpopSetting != null
              ? onWillpopSetting!['title']
              : 'Exit App'.tr,
          content: onWillpopSetting != null
              ? onWillpopSetting!['content']
              : 'Exit App'.tr,
          onOkPressed: onWillpopSetting != null
              ? () => Get.offAllNamed(
                    onWillpopSetting!['to'],
                  )
              : exit(0),
        ).then((result) => result);
        return false;
      },
      child: Scaffold(
        // key: controller.scaffoldKey,
        appBar: _appBar(),
        drawer: _startDrawer(controller),
        drawerEnableOpenDragGesture: false,
        body: body,
        bottomNavigationBar: _bottomNavigationBar(controller),
        floatingActionButton: _floatingActionButton(
          controller,
          onFabPressed,
          fabToolTib,
        ),
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

  FloatingActionButton? _floatingActionButton(
    AppController controller,
    VoidCallback? onPressed,
    String? toolTip,
  ) {
    if (!needFloatingActionButton) return null;
    return FloatingActionButton(
      backgroundColor: controller.changeColor(),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      tooltip: toolTip,
      child: FittedBox(
        child: Icon(
          Icons.add,
        ),
      ),
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
              color: controller.changeColor(),
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
                Get.offAndToNamed(controller.drawerItems[index]['to']);
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

/**
 * Widget? child,
  String? tooltip,
  Color? foregroundColor,
  Color? backgroundColor,
  Color? focusColor,
  Color? hoverColor,
  Color? splashColor,
  Object? heroTag = const _DefaultHeroTag(),
  double? elevation,
  double? focusElevation,
  double? hoverElevation,
  double? highlightElevation,
  double? disabledElevation,
  required void Function()? onPressed,
  MouseCursor? mouseCursor,
  bool mini = false,
  ShapeBorder? shape,
  Clip clipBehavior = Clip.none,
  FocusNode? focusNode,
  bool autofocus = false,
  MaterialTapTargetSize? materialTapTargetSize,
  bool isExtended = false,
  bool? enableFeedback,
 */