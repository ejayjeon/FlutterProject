import 'package:flutter/material.dart';
import 'color_schemes.g.dart';

// 색상변수
var lightBg = lightColorScheme.primary;
var darkBg = darkColorScheme.primary;
var lightText = lightColorScheme.onSurface;
var darkText = darkColorScheme.onSurface;
var lightOutline = lightColorScheme.outline;
var darkOutline = darkColorScheme.outline;

// 시스템 화면 모드
var customThemeMode = ThemeMode.system;

var lightThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Pretendard',
  colorScheme: lightColorScheme,
  textTheme: lightTextTheme,
  inputDecorationTheme: lightInputTheme,
);

var darkThemeData = lightThemeData.copyWith(
  colorScheme: darkColorScheme,
  textTheme: darkTextTheme,
  inputDecorationTheme: darkInputTheme,
);

// 개별 Text ThemeData
var lightTextTheme = TextTheme(
  headline1: TextStyle(
    fontSize: 30.0,
    color: lightText,
    fontWeight: FontWeight.w900,
  ),
  headline2: TextStyle(
    fontSize: 25.0,
    color: lightText,
    fontWeight: FontWeight.w800,
  ),
  headline3: TextStyle(
    fontSize: 20.0,
    color: lightText,
    fontWeight: FontWeight.w700,
  ),
  headline4: TextStyle(
    fontSize: 17.0,
    color: lightText,
    fontWeight: FontWeight.w600,
  ),
  bodyText1: TextStyle(
    fontSize: 14.0,
    color: lightText,
    fontWeight: FontWeight.w400,
  ),
  caption: TextStyle(
    fontSize: 12.0,
    color: lightColorScheme.onSurfaceVariant,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
  ),
);

var darkTextTheme = lightTextTheme.copyWith(
  headline1: lightTextTheme.headline1!.copyWith(
    color: darkText,
  ),
  bodyText1: lightTextTheme.bodyText1!.copyWith(
    color: darkText,
  ),
  caption: lightTextTheme.caption!.copyWith(
    color: darkColorScheme.onSurfaceVariant,
  ),
);

// 개별 Input ThemeData
var lightInputTheme = InputDecorationTheme(
  focusColor: lightColorScheme.tertiary,
  iconColor: lightColorScheme.primary,
  prefixIconColor: lightColorScheme.primary,
  suffixIconColor: lightColorScheme.primary,
  fillColor: lightColorScheme.surfaceVariant,
  isCollapsed: true,
  contentPadding: const EdgeInsets.all(16.0),
  errorMaxLines: 1,
  hintStyle: TextStyle(
    color: lightOutline,
    fontSize: 13.0,
  ),
  errorStyle: TextStyle(
    color: lightColorScheme.error,
    fontSize: 12.0,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primary,
      width: 1.0,
    ),
  ),
);

var darkInputTheme = lightInputTheme.copyWith(
  focusColor: darkColorScheme.tertiary,
  iconColor: darkColorScheme.primary,
  prefixIconColor: darkColorScheme.primary,
  suffixIconColor: darkColorScheme.primary,
  fillColor: darkColorScheme.surfaceVariant,
  hintStyle: lightInputTheme.hintStyle!.copyWith(
    color: darkOutline,
  ),
  errorStyle: lightInputTheme.errorStyle!.copyWith(
    color: darkColorScheme.error,
  ),
  focusedBorder: lightInputTheme.focusedBorder!.copyWith(
    borderSide: lightInputTheme.focusedBorder!.borderSide.copyWith(
      color: darkColorScheme.primaryContainer,
    ),
  ),
  enabledBorder: lightInputTheme.enabledBorder!.copyWith(
    borderSide: lightInputTheme.enabledBorder!.borderSide.copyWith(
      color: darkColorScheme.primary,
    ),
  ),
);
