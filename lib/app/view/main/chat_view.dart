import 'package:flutter/material.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Container(
        child: Center(
          child: Text('CHAT'),
        ),
      ),
      needBottomNavigationBar: true,
    );
  }
}
