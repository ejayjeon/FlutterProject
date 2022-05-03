import 'package:flutter/material.dart';
import 'package:scroll_view/const/colors.dart';
import 'package:scroll_view/layout/main_layout.dart';

class ReOrderableListViewScreen extends StatefulWidget {
  const ReOrderableListViewScreen({Key? key}) : super(key: key);

  @override
  State<ReOrderableListViewScreen> createState() =>
      _ReOrderableListViewScreenState();
}

class _ReOrderableListViewScreenState extends State<ReOrderableListViewScreen> {
  List<int> numbers = List.generate(100, (idx) => idx);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ReOrderableListView',
      // 위젯을 길게 눌러서 순서를 바꿔주는 위젯
      body: renderBuilder(),
    );
  }

// 1. 한꺼번에 불러옴
  Widget renderDefault() {
    return ReorderableListView(
      // 화면에서 순서를 바꾸고나면, onReorder에서 데이터를 바꿔주는 작업을 함
      // oldIdx - newIdx
      // oldIdx : 처음에 있던 위젯의 순서대로 oldIdx가 산정이 됨
      onReorder: ((int oldIdx, int newIdx) {
        setState(() {
// 1번 패턴 : old < new : new -= 1;
          // [red(0), orange(1), yellow(2)]
          // red -> yellow 다음으로 옮김 (0) -> (3) red를 삭제하기 전에 위치를 산정함 -> 인덱스가 1개 늘어남, 실제로 옮기고 나서 인덱스가 몇 번인지는 중요하지 않음. 옮기기 전이 중요함!!!
          // oldIdx가 newIdx보다 작은 상태라면, 삭제하기 전이니까 1개가 늘어난 상태에서 newIdx가 산정됨 -> oldIdx + 1 = newIdx

// 2번 패턴 : old > new : new 인덱스 그대로 사용
          // [red(0), orange(1), yellow(2)]
          // yellow -> red 앞으로 옮기고 싶다. (2) -> (0)
          // oldIdx가 newIdx보다 크게되면 그냥 대체해버림

          // 예전의 인덱스를 지우고, 그 자리에다가 새로운 인덱스를 집어넣는다

          if (oldIdx < newIdx) {
            newIdx -= 1;
          }
          final item = numbers.removeAt(oldIdx);
          numbers.insert(newIdx, item);
        });
      }),
      children: numbers
          .map(
            (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e),
          )
          .toList(),
    );
  }

// 2. 화면에 보여지는 만큼 불러옴
// idx를 그대로 사용하는 것이 아니라, 화면에서 변경되는 대로 데이터도 변경될 수 있도록 데이터의 값을 바라보게 만든다
  Widget renderBuilder() {
    return ReorderableListView.builder(
      itemBuilder: (context, idx) {
        return renderContainer(
            // itembuilder가 봤을 때 idx 값을 그대로 넣으면 위치를 바꿔도 그 아이템은 그대로임
            // idx는 순서를 바꾸는 것에 따라 바뀌기 때문에, idx 값으로 직접 하지 않고 데이터를 바라볼 수 있게 함
            color: rainbowColors[numbers[idx] % rainbowColors.length],
            index: numbers[idx]);
      },
      itemCount: numbers.length,
      onReorder: ((int oldIdx, int newIdx) {
        setState(
          () {
            if (oldIdx < newIdx) {
              newIdx -= 1;
            }
            final item = numbers.removeAt(oldIdx);
            numbers.insert(newIdx, item);
          },
        );
      }),
    );
  }

  Widget renderContainer(
      {required Color color, required int index, double? height}) {
    print(index);
    return Container(
      // 컨테이너 별로 고유의 키를 넣어줌
      key: Key(
        index.toString(),
      ),
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
