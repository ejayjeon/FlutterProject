import 'package:flutter/material.dart';
import 'package:video_player/layout/main_layout.dart';
import 'package:video_player/screen/home_screen.dart';

class RouteThree extends StatelessWidget {
  const RouteThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(title: 'Route Three', children: [
      Text('argument: ${args}'),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return HomeScreen();
              },
            ),
          );
        },
        child: const Text('Return to Home'),
      ),
    ]);
  }
}
