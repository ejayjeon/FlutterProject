import 'package:flutter/material.dart';
import 'package:scroll_view/const/colors.dart';
import 'package:scroll_view/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);
  GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'GridViewScreen',
      body: GridView.builder(
        // 어떤 모양으로 그리드를 그릴 지 정의를 해주어야 함, 화면에 보여지는 것만큼만 그려짐 -> 효율적
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // 그리드 뷰의 최대 길이
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemBuilder: (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        },
      ),
    );
  }

// 1. Count, 한꺼번에 불러옴
  Widget renderCount() {
    return GridView.count(
      // 가로 개수, 필수
      crossAxisCount: 3,
      crossAxisSpacing: 12.0, // 가로간격
      mainAxisSpacing: 12.0, // 세로간격
      children: numbers
          .map(
            (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e),
          )
          .toList(),
    );
  }

// 2. 보이는 것만 그림
  Widget renderFixedBuilder() {
    return GridView.builder(
      // 어떤 모양으로 그리드를 그릴 지 정의를 해주어야 함, 화면에 보여지는 것만큼만 그려짐 -> 효율적
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
    );
  }

// 3. 한 번에 화면을 다 그리지는 않음. 하지만 특수한 경우에 아이템의 최대 사이즈를 정해서 나눌 수 있음
  Widget renderMaxBuilder() {
    return GridView.builder(
      // 어떤 모양으로 그리드를 그릴 지 정의를 해주어야 함, 화면에 보여지는 것만큼만 그려짐 -> 효율적
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // 그리드 뷰의 최대 길이
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
    );
  }

  Widget renderContainer(
      {required Color color, required int index, double? height}) {
    print(index);
    return Container(
      height: height ?? 100,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
