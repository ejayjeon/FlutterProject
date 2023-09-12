import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/controller/home_controller.dart';
import 'package:whoever/app/service/firebase_service.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final token;
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
            onPressed: () async {
              // controller.getRdNum();
              await FirebaseService.getToken().then((value) => Log(value));
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
