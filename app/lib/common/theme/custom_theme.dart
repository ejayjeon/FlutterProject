import 'package:flutter/material.dart';
import 'color_schemes.g.dart';

// 색상변수
mode(ThemeMode mode) {
  return mode == ThemeMode.light
      ? lightColorScheme.primary
      : darkColorScheme.primary;
}

// 테마 모드 : copyWith 사용했더니 적용이 안됨. 왜?
var lightThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Pretendard',
  colorScheme: lightColorScheme,
  primaryColor: lightColorScheme.primary,
  hoverColor: darkColorScheme.primary,
  // inputDecorationTheme: lightInputTheme,
);

var darkThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Pretendard',
    colorScheme: darkColorScheme,
    primaryColor: darkColorScheme.primary,
    hoverColor: lightColorScheme.primary
    // inputDecorationTheme: darkInputTheme,
    );

// 개별 Input ThemeData
var darkInputTheme = InputDecoration(
  focusColor: lightColorScheme.tertiary,
  iconColor: lightColorScheme.primary,
  fillColor: lightColorScheme.surfaceVariant,
  isCollapsed: true,
  contentPadding: const EdgeInsets.all(16.0),
  errorMaxLines: 1,
  hintStyle: TextStyle(
    color: lightColorScheme.secondary,
    fontSize: 13.0,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primary,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
);

var lightInputTheme = InputDecoration(
  focusColor: darkColorScheme.tertiary,
  iconColor: darkColorScheme.primary,
  fillColor: darkColorScheme.surfaceVariant,
  isCollapsed: true,
  contentPadding: const EdgeInsets.all(16.0),
  errorMaxLines: 1,
  hintStyle: TextStyle(
    color: darkColorScheme.secondary,
    fontSize: 13.0,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primary,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
);

// 개별 Button Style
var darkButtonTheme = ElevatedButton.styleFrom(
  padding: const EdgeInsets.all(16.0),
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  backgroundColor: darkColorScheme.primary,
  foregroundColor: lightColorScheme.primary,
  textStyle: const TextStyle(
    fontSize: 14.0,
  ),
);
var lightButtonTheme = ElevatedButton.styleFrom(
  padding: const EdgeInsets.all(16.0),
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  backgroundColor: lightColorScheme.primary,
  foregroundColor: darkColorScheme.primary,
  textStyle: const TextStyle(
    fontSize: 14.0,
  ),
);
