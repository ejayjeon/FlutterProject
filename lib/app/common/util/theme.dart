import 'package:flutter/material.dart';
import 'package:whoever/app/common/util/color_schemes.g.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: lightColorScheme.primaryContainer,
  brightness: Brightness.dark,
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(lightColorScheme.primaryContainer),
    trackColor: MaterialStateProperty.all(lightColorScheme.secondaryContainer),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: lightColorScheme.primaryContainer,
    disabledColor: lightColorScheme.secondaryContainer,
  ),
);
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: lightColorScheme.primaryContainer,
  brightness: Brightness.light,
  buttonTheme: ButtonThemeData(
    buttonColor: lightColorScheme.primaryContainer,
    disabledColor: lightColorScheme.secondaryContainer,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(lightColorScheme.primaryContainer),
    trackColor: MaterialStateProperty.all(lightColorScheme.secondaryContainer),
  ),
);
