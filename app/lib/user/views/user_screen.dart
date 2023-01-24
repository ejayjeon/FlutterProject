import 'package:app/common/layout/main_layout.dart';
import 'package:flutter/cupertino.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Center(
        child: Text('유저'),
      ),
    );
  }
}
