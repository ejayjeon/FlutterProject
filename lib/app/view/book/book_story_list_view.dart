import 'package:flutter/material.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';

class BookStoryListView extends StatelessWidget {
  const BookStoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: CustomScrollView(
              slivers: [
                _sliverGrid(),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: CustomScrollView(
              slivers: [
                _sliverList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverList _sliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 30,
        (context, index) => ListTile(
          title: Text('Top ${index}'),
        ),
      ),
    );
  }

  SliverGrid _sliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => Container(
          height: 100,
          color: Colors.green[100 * (index % 9)],
          child: Center(
            child: Text('Bottom ${index}'),
          ),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
    );
  }
}
