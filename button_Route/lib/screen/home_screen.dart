import 'package:flutter/material.dart';
import 'package:video_player/layout/main_layout.dart';
import 'package:video_player/screen/route_one.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'HomeScreen', children: [
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return RouteOne();
              },
            ),
          );
        },
        child: const Text('Route One'),
      ),
    ]);
  }
}

class _button extends StatelessWidget {
  const _button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return RouteOne();
            },
          ),
        );
      },
      child: const Text('ElevatedButton'),
      style: ButtonStyle(
        // 버튼의 상태에 따라서 값을 변경
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.amber;
            } else if (states.contains(MaterialState.focused)) {
              return Colors.pink;
            }
            return null;
          },
        ),
      ),
    );
  }
}
