import 'package:flutter/material.dart';
import 'package:flutter_by_getx_dio/app/controller/home_binding.dart';
import 'package:flutter_by_getx_dio/app/view/home_view.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeView(),
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
