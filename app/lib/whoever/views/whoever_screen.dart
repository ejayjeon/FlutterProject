import 'package:app/common/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WhoeverScreen extends StatelessWidget {
  static String get routeName => 'whoever';
  final ValueNotifier themeNotifier;
  const WhoeverScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    const rainbowColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.pink,
      Colors.purple
    ];
    return MainLayout(
      needFab: true,
      fabIcon: Icons.add,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 1개 행에 보여줄 item 개수
            childAspectRatio: 1 / 1, // 가로 1 : 세로 2
            mainAxisExtent: 150, // 아이템 개수
            mainAxisSpacing: 5, // 열 패딩
            crossAxisSpacing: 5, // 행 패딩
          ),
          itemBuilder: ((context, index) {
            return feedItem(
              color: rainbowColors[index % rainbowColors.length],
              index: index,
              context: context,
            );
          }),
        ),
      ),
    );
  }

  Widget feedItem({
    required Color color,
    required int index,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        // 해당 index 이미지를 클릭했을 때, 라우터를 통해 상세 페이지로 이동
        print('클릭 $index');
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 2.0, color: color),
          borderRadius: BorderRadius.circular(5.0),
        ),
        width: MediaQuery.of(context).size.width * 0.3,
        height: 500,
        child: Center(
          child: Text(
            index.toString(),
          ),
        ),
      ),
    );
  }
}
