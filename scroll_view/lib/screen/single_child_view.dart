import 'package:flutter/material.dart';
import 'package:scroll_view/const/colors.dart';
import 'package:scroll_view/layout/main_layout.dart';

class SingleChildView extends StatelessWidget {
  // list.generate : 리스트 쉽게 만드는 법
  final List<int> numbers = List.generate(100, (i) => i);
  SingleChildView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(numbers);
    return MainLayout(
      title: 'SingleChildView',
      body: renderPerformance(),
    );
  }

// 1. SingleChildView Scroll
  Widget renderSingleChildScroll() {
    return SingleChildScrollView(
      // 99% 여러 개의 위젯을 스크롤 하고 싶을 때?
      // child에 위젯을 넣어서 스크롤, 위젯 크기가 화면의 크기를 넘어가면 스크롤이 시작됨
      // 크기를 넘어서지 않아도 스크롤을 강제로 할 수 있음 : physics : NeverScrollablePhysics() -> AlwaysScrollablePhysics()
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(
                color: e,
              ),
            )
            .toList(),
      ),
      physics: ClampingScrollPhysics(),
    );
  }

// 1-1. singlechildview에서 언제나 스크롤이 가능하게
// 1-2. chipBehavior: Clip을 써서 잘리지 않게 구현
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(), // 튕기지 않음 Android Style
      // BouncingScrollPhysics(), 튕기듯이 iOS Style
      // AlwaysScrollableScrollPhysics(),
      //// NeverScrollablPhysics(),
      clipBehavior: Clip.none,
      child: Column(
        children: [renderContainer(color: Colors.black)],
      ),
    );
  }

  Widget renderPerformance() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (e) => renderContainer(
                // e : 0 ~ 99 % 길이인 7로 나누면 0 ~ 6까지 나옴
                color: rainbowColors[e % rainbowColors.length],
                // ListView와는 달리, 화면에 보이지 않아도 한 번에 모든 위젯을 렌더링함
                // SingleChildView : 퍼포먼스가 좋지 않음
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    if (index != null) print(index);
    return Container(
      height: 100,
      color: color,
    );
  }
}
