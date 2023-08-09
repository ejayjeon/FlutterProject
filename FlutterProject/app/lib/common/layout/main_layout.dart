import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget body;
  final VoidCallback? onPressed;
  final Widget? bottomNav;
  final Widget? fab;
  const MainLayout({
    this.title,
    this.icon,
    required this.body,
    this.bottomNav,
    this.onPressed,
    this.fab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: bottomNav,
      floatingActionButton: fab,
    );
  }

  AppBar? _appBar() {
    if (title == null) {
      return null;
    }

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
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: body,
    );
  }
}
