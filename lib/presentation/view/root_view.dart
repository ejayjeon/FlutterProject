import 'package:flutter/material.dart';
import 'package:whoever/common/layout/main_layout.dart';
import 'package:whoever/common/theme/custom_theme.dart';
import 'package:whoever/presentation/view/edit/edit_view.dart';
import 'package:whoever/presentation/view/home/home_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int tabIndex = 0;
  List<Widget> renderPages = [
    HomeView(),
    EditView(),
  ];
  List navBarItemData = [
    {
      'icon': Icons.home_outlined,
      'label': '홈',
      'toolTip': 'HOME',
    },
    {
      'icon': Icons.create,
      'label': '에디터',
      'toolTip': 'EDIT',
    },
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: renderPages.length, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);

    super.dispose();
  }

  void tabListener() {
    setState(() {
      tabIndex = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: CustomTheme.PRIMARY_COLOR,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: tabIndex,
        items: List.generate(
          navBarItemData.length,
          (index) => navBarItem(
            iconPath: navBarItemData[index]['icon'],
            label: navBarItemData[index]['label'],
            toolTip: navBarItemData[index]['toolTip'],
          ),
        ).toList(),
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: renderPages,
      ),
    );
  }

  BottomNavigationBarItem navBarItem({
    required IconData iconPath,
    required String label,
    String? toolTip,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(iconPath),
      label: label,
    );
  }
}
