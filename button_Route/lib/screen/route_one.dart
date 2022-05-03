import 'package:flutter/material.dart';
import 'package:video_player/layout/main_layout.dart';
import 'package:video_player/screen/route_two.dart';

class RouteOne extends StatelessWidget {
  const RouteOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'Route One', children: [
      ElevatedButton(
        onPressed: () {
          // [HomeScreen(), RouteOne(), RouteTwo()... ]
          // Stack 구조
          Navigator.of(context).push(
            MaterialPageRoute(
              settings: RouteSettings(arguments: 789),
              builder: (BuildContext context) {
                return RouteTwo();
              },
            ),
          );
        },
        child: const Text('Route Two'),
      ),
    ]);
  }
}
