import 'package:flutter/material.dart';
import 'package:scroll_view/layout/main_layout.dart';
import 'package:scroll_view/screen/grid_view_screen.dart';
import 'package:scroll_view/screen/list_view_screen.dart';
import 'package:scroll_view/screen/reoderable_list_view_screen.dart';
import 'package:scroll_view/screen/single_child_view.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name,
  });
}

class HomeScreen extends StatelessWidget {
  final screens = [
    ScreenModel(
      builder: (_) => SingleChildView(),
      name: 'SingleChildViewScreen',
    ),
    ScreenModel(
      builder: (_) => ListViewScreen(),
      name: 'ListViewScreen',
    ),
    ScreenModel(
      builder: (_) => GridViewScreen(),
      name: 'GridViewScreen',
    ),
    ScreenModel(
      builder: (_) => ReOrderableListViewScreen(),
      name: 'ReOrderableListViewScreen',
    ),
  ];
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screens
              .map(
                (screen) => ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: screen.builder),
                    );
                  },
                  child: Text(screen.name),
                ),
              )
              .toList(),
          // children: [
          //   ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (_) => SingleChildView(),
          //         ),
          //       );
          //     },
          //     child: Text('SingleChildView'),
          //   ),
          // ],
        ),
      ),
    );
  }
}
