// ignore_for_file: unused_import

import 'package:dayxday/controllers/home_controller.dart';
import 'package:dayxday/pages/homepage.dart';
import 'package:dayxday/pages/rootpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'router.dart';
import 'style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: BindingsBuilder((){
        Get.put(HomeController());
      }),
      getPages: Routers.routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: RootPage(),
    );
  }
}