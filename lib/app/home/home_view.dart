import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HOME'),
      ),
    );
  }
}
