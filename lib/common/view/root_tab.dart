import 'package:flutter/material.dart';
import 'package:nosh/common/layout/main_layout.dart';
import 'package:nosh/restaurant/view/restaurant_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;
  // Tab View 컨트롤을 위한 컨트롤러 셋팅
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    // 특정 값이 변경될 때마다 (index) Listener를 실행해야함
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
      title: 'NOSH',
      body: TabBarView(
        controller: controller,
        // 탭에서 스와이프 했을 때 탭이 움직이지 않게 하기 위함
        physics: NeverScrollableScrollPhysics(),
        children: [
          RestaurantScreen(),
          Container(
            child: Text('음식'),
          ),
          Container(
            child: Text('주문'),
          ),
          Container(
            child: Text('프로필'),
          ),
        ],
      ),
      bottomNav: BottomNavigationBar(
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood_outlined,
            ),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt_long_outlined,
            ),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}
