import 'package:flutter/material.dart';

abstract class CustomTheme {
  static const Color BGCOLOR = Color(0xFFFFFFFF);
  static const Color PRIMARY_COLOR = Color(0xFF00FFDD);
  static const Color SECONDARY_COLOR = Color(0xFF003632);
  static final customThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'GmarketSans',
    inputDecorationTheme: customInputTheme,
  );
}

final customInputTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
  errorMaxLines: 1,
);

final HEADER_TEXT = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 20.0,
);

final BASIC_TEXT = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
);

final SMALL_TEXT = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 12.0,
);
