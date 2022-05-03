import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: MyColor.bgColorWhite,
    primaryColor: MyColor.veryPeri,
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: MyColor.bgColorDark,
    primaryColor: MyColor.veryPeri,
  );
}

class MyColor {
  static const veryPeri = Color.fromRGBO(102, 103, 171, 1);
  static const bgColorDark = Color(0xFF2E2E2E);
  static const bgColorWhite = Color(0xFFFFFBFB);
}
