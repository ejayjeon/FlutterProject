import 'package:flutter/material.dart';
import 'package:scroll_view/const/colors.dart';
import 'package:scroll_view/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (i) => i);
  ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      // children 파라미터에 곧바로 원하는 위젯들을 넣어서 사용
      body: renderSeperate(),
    );
  }

// 1. 한꺼번에 모두 불러옴
  Widget renderDefault() {
    return ListView(
      children: numbers
          .map(
            (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e),
          )
          .toList(),
    );
  }

// 2. builder를 사용해서 화면에 그려지는 부분만 렌더링함
  Widget renderBuilder() {
    return ListView.builder(
      itemBuilder: (context, i) {
        return renderContainer(
          color: rainbowColors[i % rainbowColors.length],
          index: i,
        );
      },
      itemCount: 100,
    );
  }

// 3. seperated로 번갈아 가면서 렌더링 : 화면에 보이는 부분까지만 렌더링
  Widget renderSeperate() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, i) {
        return renderContainer(
            color: rainbowColors[i % rainbowColors.length], index: i);
      },
      separatorBuilder: (context, i) {
        i += 1;
// 5개의 item마다 배너 보여주기 ?
        if (i % 5 == 0) {
          return renderContainer(
            color: Colors.black,
            index: i,
            height: 50,
          );
        }
        return SizedBox(height: 8.0);
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
