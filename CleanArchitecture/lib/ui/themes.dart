import 'package:flutter/material.dart';
import 'package:jemmemo/ui/colors.dart';

final darkTheme = ThemeData(
  unselectedWidgetColor: bgWhite,
  primaryColor: bgWhite,
  backgroundColor: darkGray,
  canvasColor: darkGray,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: bgWhite,
    foregroundColor: darkGray,
  ),
  appBarTheme: AppBarTheme(backgroundColor: darkGray),
  snackBarTheme: SnackBarThemeData(backgroundColor: bgGrey),
);
final brightTheme = ThemeData(
  unselectedWidgetColor: darkGray,
  primaryColor: darkGray,
  backgroundColor: bgWhite,
  canvasColor: bgWhite,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkGray,
    foregroundColor: bgWhite,
  ),
  appBarTheme: AppBarTheme(backgroundColor: bgWhite),
  snackBarTheme: SnackBarThemeData(backgroundColor: bgGrey),
);
