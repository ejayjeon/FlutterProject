import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookTest extends StatelessWidget {
  const BookTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.currentRoute.toString()),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.lightBlue,
        child: Center(
          child: Text(
            Get.currentRoute.toUpperCase(),
          ),
        ),
      ),
    );
  }
}
