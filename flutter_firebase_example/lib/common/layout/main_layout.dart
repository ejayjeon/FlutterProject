import 'package:flutter/material.dart';
import 'package:whoever/common/theme/custom_theme.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String? appBarTitle;
  final Color? bgColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  const MainLayout({
    super.key,
    required this.child,
    this.appBarTitle,
    this.bgColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor ?? CustomTheme.BGCOLOR,
      appBar: renderAppBar(),
      body: renderChild(child: child),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar() {
    if (appBarTitle == null) {
      return null;
    }
    return AppBar(
      backgroundColor: bgColor ?? CustomTheme.BGCOLOR,
      elevation: 0,
      foregroundColor: Colors.black,
      title: Text(
        appBarTitle!,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget renderChild({
    required Widget child,
  }) {
    return SafeArea(
      top: false,
      child: child,
    );
  }
}
