import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  MainLayout({
    super.key,
    required this.body,
    this.backgroundColor,
    this.title,
    this.bottomNav,
  });

  final Widget body;
  String? title;
  Color? backgroundColor;
  final Widget? bottomNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      backgroundColor: backgroundColor ?? const Color(0xFFFBFBFB),
      body: body,
      bottomNavigationBar: bottomNav,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        title: Text(title!),
      );
    }
  }
}
