import 'package:app/common/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  static String get routeName => 'home';
  final ValueNotifier themeNotifier;
  const HomeScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'HOME',
      onPressed: () {
        widget.themeNotifier.value =
            widget.themeNotifier.value == ThemeMode.light
                ? ThemeMode.dark
                : ThemeMode.light;
      },
      icon: widget.themeNotifier.value == ThemeMode.light
          ? Icons.nightlight_round_rounded
          : Icons.sunny,
      body: Container(),
    );
  }
}
