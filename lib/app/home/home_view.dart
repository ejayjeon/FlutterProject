import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          controller.obx(
            (state) => _container('${controller.text}'),
            onError: (error) => _container('Error'),
            onEmpty: _container('Empty'),
            onLoading: const Center(child: CircularProgressIndicator()),
          ),
          ElevatedButton(
            onPressed: () {
              controller.getRdNum();
            },
            child: Text('Enter'),
          ),
        ],
      ),
    );
  }

  Widget _container(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
