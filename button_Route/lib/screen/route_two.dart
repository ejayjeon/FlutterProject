import 'package:flutter/material.dart';
import 'package:video_player/layout/main_layout.dart';
import 'package:video_player/screen/route_three.dart';

class RouteTwo extends StatelessWidget {
  const RouteTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: 'Route Two',
      children: [
        Text('arguments: ${args}'),
        // RouteOne에서 settings로 넘겨준 값
        ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (BuildContext context) {
            //       return RouteThree();
            //     },
            //   ),
            // );
            Navigator.of(context).pushNamed('/three', arguments: '안녕');
          },
          child: const Text('Named Route Three'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => RouteThree(),
                ),
              );
            },
            child: Text('Push Replacement'))
      ],
    );
  }
}
