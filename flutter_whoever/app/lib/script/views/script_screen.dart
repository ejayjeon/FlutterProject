import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScriptScreen extends StatelessWidget {
  const ScriptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _appBar('앱바'),
        _labelHeader(),
        _sliverList(),
        _labelHeader(),
        _sliverGrid(),
        _labelHeader(),
        _sliverGrid(),
      ],
    );
  }

  SliverAppBar _appBar(String title) {
    if (title == null) return SliverAppBar();
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: true,
      stretch: true,
      expandedHeight: 150.0,
      collapsedHeight: 120.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/dream.jpeg',
          fit: BoxFit.cover,
        ),
        title: Text(
          title!,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: '설정 바로가기',
          onPressed: () {/* ... */},
        ),
      ],
    );
  }

  SliverPersistentHeader _labelHeader() {
    return SliverPersistentHeader(
      pinned: true,
      // 실제로 어떤 코드가 정의되어야 하는지 delegate에서 결정함
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.black,
          child: Container(
            child: Center(
              child: Text(
                'Header',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        minHeight: 50.0,
        maxHeight: 100.0,
      ),
    );
  }

  SliverList _sliverList() {
    // final rainbowColors = [
    //   0xff0000,
    //   0xff9900,
    //   0xfbff00,
    //   0x88ff00,
    //   0x00c3ff,
    //   0x0008ff,
    //   0xa200ff,
    // ];
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 20,
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
      ),
    );
  }

  SliverGrid _sliverGrid() {
    // final rainbowColors = [
    //   0xff0000,
    //   0xff9900,
    //   0xfbff00,
    //   0x88ff00,
    //   0x00c3ff,
    //   0x0008ff,
    //   0xa200ff,
    // ];
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
    final numbers = List.generate(
      100,
      ((index) => index),
    );
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: 100,
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
  }) {
    return Container(
      height: 100,
      color: color,
      child: Center(
        child: Text(index.toString()),
      ),
    );
  }
}

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // 화면에 보이는 모양
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // 최대 높이
  double get maxExtent => maxHeight;

  @override
  // 최소 높이
  double get minExtent => minHeight;

  @override
  // covariant: 상속된 클래스도 사용가능
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    // oldDelegate: Re-Build가 되기 전에 기존에 존재하던 delegate
    // 새로운 delegate => this
    // shoudRebuild : 새로 Build를 할지 말지? 값들을 어떻게든 비교해서 delegate를 실행할지 말지 결정
    return // 특정 컨디션에 맞춰서 빌드
        oldDelegate.minExtent != minHeight ||
            oldDelegate.maxHeight != maxHeight ||
            oldDelegate.child != child;
  }
}
