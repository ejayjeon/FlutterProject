import 'package:app/common/layout/main_layout.dart';
import 'package:flutter/material.dart';

class BookRack extends StatelessWidget {
  const BookRack({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            WBox(
              color: Colors.pink,
              title: '1',
            ),
            WBox(
              color: Colors.red,
              title: '2',
            ),
            WBox(
              color: Colors.lightBlue,
              title: '3',
            ),
            WBox(
              color: Colors.lime,
              title: '4',
            ),
            WBox(
              color: Colors.yellow,
              title: '5',
            ),
          ],
        ),
      ),
    );
  }
}

class WBox extends StatelessWidget {
  final Color color;
  final String title;
  const WBox({
    super.key,
    required this.color,
    this.title = '안녕',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: color,
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
