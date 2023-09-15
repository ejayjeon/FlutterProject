import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLayout extends StatelessWidget {
  final String? title;
  final Widget body;
  final Drawer? drawer;
  final BottomNavigationBar? bottomNavigationBar;
  final VoidCallback? onSearchPressed;
  const AppLayout({
    super.key,
    this.title,
    required this.body,
    this.drawer,
    this.bottomNavigationBar,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: drawer,
      drawerEnableOpenDragGesture: false,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
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
}
