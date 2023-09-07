import 'package:flutter/material.dart';

class ReOrderableView extends StatefulWidget {
  const ReOrderableView({super.key});

  @override
  State<ReOrderableView> createState() => _ReOrderableViewState();
}

class _ReOrderableViewState extends State<ReOrderableView> {
  final newList = [];
  List<int> numbers = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView.builder(
        itemBuilder: (_, index) {
          // 레퍼런스할 숫자와 실제 순서를 혼동하지 말것
          return renderContainer(numbers[index]);
        },
        itemCount: numbers.length,
        onReorder: _onReorder,
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = numbers.removeAt(oldIndex);
      numbers.insert(newIndex, item);
    });
  }

  Widget _reorderList() {
    return ReorderableListView(
      children: List.generate(30, (index) => renderContainer(index)),
      // 화면에서 변경된 순서를 변경해줌
      onReorder: (oldIndex, newIndex) {
        // pattern 1
        // [a, b, c]
        //  0, 1, 2
        // a를 c 다음으로 옮기고 싶다면
        // [b, c, a]
        // a: 0 oldIndex -> 3 newIndex
        // 옮기기 전에 산정한 인덱스가 nexIndex가 된다

        // pattern 2
        // c를  a전으로 옮기고 싶다면
        // [c, a, b]
        // c: 2 oldIndex -> 0 newIndex
        // 옮기기 전의 인덱스와 옮긴 후의 인덱스는 같다.

        // pattern1 : oldIndex가 nexIndex보다 작으면 newIndex -1로 대체
        // pattern2 : oldIndex가 nexIndex보다 크면 newIndex로 대체

        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          // 리스트에서 기존의 인덱스를 지우고
          final item = newList.removeAt(oldIndex);

          // 해당 리스트에 새로운 인덱스로 갈아 끼워준다
          newList.insert(newIndex, item);
        });
      },
    );
  }

  Widget renderContainer(int index) {
    return Container(
      key: Key(index.toString()),
      width: double.infinity,
      height: 50,
      color: Colors.amber[100 * (index % 9)],
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
