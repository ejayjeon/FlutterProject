import 'package:app/common/main_layout.dart';
import 'package:flutter/material.dart';

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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;
  final List tabName = ['HOME', 'WHOEVER', 'OWN', 'USER'];
  final List tabIcon = [
    Icons.home,
    Icons.people,
    Icons.now_widgets_rounded,
    Icons.manage_accounts_rounded,
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabName.length, vsync: this);
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

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
      body: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          tabName.length,
          (index) => Container(
            child: Center(
              child: Text(
                tabName[index].toString(),
              ),
            ),
          ),
        ),
      ),
      bottomNav: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: List.generate(
          tabName.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(tabIcon[index]),
            label: tabName[index],
          ),
        ),
      ),
    );
  }
}
