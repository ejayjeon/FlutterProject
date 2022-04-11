import 'package:flutter/material.dart';
import 'package:scroll_view/layout/main_layout.dart';
import 'package:scroll_view/screen/single_child_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SingleChildView(),
                  ),
                );
              },
              child: Text('SingleChildView'),
            ),
          ],
        ),
      ),
    );
  }
}
