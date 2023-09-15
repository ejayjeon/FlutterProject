import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Container(
        child: Center(
          child: Text('SETTING'),
        ),
      ),
    );
  }
}
