import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget body;
  final VoidCallback? onPressed;
  final Widget? bottomNav;
  final Widget? fab;

  const MainLayout({
    super.key,
    this.title,
    this.icon,
    this.onPressed,
    this.bottomNav,
    this.fab,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
      bottomNavigationBar: bottomNav,
      floatingActionButton: fab,
    );
  }

// 앱바
  AppBar? _appbar() {
    if (title == null) return null;

    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
        ),
      ],
      elevation: 0,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
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
}
