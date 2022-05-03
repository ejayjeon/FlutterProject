// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dayxday/main.dart';
import 'package:get_storage/get_storage.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: MyColor.primaryL,
    appBarTheme: AppBarTheme(color: MyColor.primaryL),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.grey,
    primaryColor: MyColor.primaryD,
    appBarTheme: AppBarTheme(color: MyColor.primaryD),
  );
}
  @override
  Widget build(BuildContext context) {
    return Container();
  }


class MyColor {
  static final Color bgColor = Color(0xFFFCFCFC);
  static final Color primaryL = Color(0xFFC5C5FF);
  static final Color primaryD = Color(0xFF7070FF);
  static final Color secondaryL = Color(0xFF3939FF);
  static final Color secoundaryD = Color(0xFF0000FF);
  static final Color accent = Color(0xFFCBF066);
  static final Color fontColor = Color(0xFF292929);
}

