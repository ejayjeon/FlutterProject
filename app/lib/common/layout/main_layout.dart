import 'package:app/common/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String? title;
  final IconData? actionIcon;
  final IconData? fabIcon;
  final Widget body;
  final bool needFab;
  final VoidCallback? actionPressed;
  final VoidCallback? fabPressed;
  final Widget? bottomNav;
  final Color? backgroundColor;
  final ValueNotifier? themeNotifier;

  const MainLayout({
    super.key,
    this.title,
    this.actionIcon,
    this.actionPressed,
    this.fabPressed,
    this.fabIcon,
    this.bottomNav,
    this.needFab = false,
    required this.body,
    this.backgroundColor,
    this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appbar(),
      body: _body(),
      bottomNavigationBar: bottomNav,
      floatingActionButton: _fab(context),
    );
  }

// 앱바
  AppBar? _appbar() {
    if (title == null) return null;

    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: actionPressed,
          icon: Icon(actionIcon),
        ),
      ],
      elevation: 0,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          // color: Colors.black87,
        ),
      ),
    );
  }

// 바디
  Widget _body() {
    return SafeArea(
      child: body,
    );
  }

// FAB 버튼
  FloatingActionButton? _fab(context) {
    if (needFab == false) return null;
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        fabIcon,
        color: Theme.of(context).hoverColor,
      ),
      onPressed: fabPressed,
    );
  }
}
