import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  MainLayout({
    super.key,
    required this.body,
    this.backgroundColor,
  });

  final Widget body;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? const Color(0xFFFBFBFB),
      body: body,
    );
  }
}
