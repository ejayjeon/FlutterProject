import 'package:dustfree/components/card_title.dart';
import 'package:dustfree/components/main_card.dart';
import 'package:dustfree/components/stat_box.dart';
import 'package:dustfree/const/colors.dart';
import 'package:flutter/material.dart';

class MainStatBox extends StatelessWidget {
  const MainStatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: MainCard(
        child: LayoutBuilder(
          // 전체 너비를 찾고 싶은 위젯 바로 위에다가 선언 : LayoutBuilder
          builder: (context, constraint) {
            // constraint : 레이아웃 빌더가 차지하고 있는 공간만큼 제공이 됨
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardTitle(title: '종류별 통계'),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ListView(
                    // Column 안에서 썼을 때 무조건 Expanded
                    // 스크롤하는 방향을 바꿈 : horizontal viewport unbounded height -> 높이를 지정해주면 됨
                    scrollDirection: Axis.horizontal,
                    // 페이지가 넘어가듯이 : 자동 페이지가 넘어가듯이 physics
                    physics: const PageScrollPhysics(),
                    children: List.generate(
                      6,
                      (idx) => StatBox(
                        width: constraint.maxWidth /
                            3, // 레이아웃이 가지고 있는 사이즈인 constraint 만큼
                        category: '미세먼지',
                        imgPath: 'assets/img/noto_g3.png',
                        level: '아주 좋음',
                        stat: '$idx㎍/m³',
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
