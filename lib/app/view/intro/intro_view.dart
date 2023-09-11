import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/view_model/intro/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'INTRO',
          style: TextStyle(
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}
