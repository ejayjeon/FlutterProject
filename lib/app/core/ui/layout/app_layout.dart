import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';

class AppLayout extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool needDrawer;
  final bool needActionButton;
  final Drawer? drawer;
  final BottomNavigationBar? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final VoidCallback? onSearchPressed;
  const AppLayout({
    super.key,
    this.title,
    this.needDrawer = false,
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
      bottomNavigationBar: bottomNavigationBar,
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
}
