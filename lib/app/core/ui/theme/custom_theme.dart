import 'package:flutter/material.dart';
import 'package:whoever/app/core/ui/theme/color_schemes.g.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  // colorScheme: lightColorScheme,
  primaryColor: lightColorScheme.primaryContainer,
  disabledColor: lightColorScheme.outline,
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
  // colorScheme: darkColorScheme,
  primaryColor: darkColorScheme.primaryContainer,
  disabledColor: darkColorScheme.outline,
  brightness: Brightness.light,
  buttonTheme: ButtonThemeData(
    buttonColor: darkColorScheme.primaryContainer,
    disabledColor: darkColorScheme.secondaryContainer,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(darkColorScheme.primaryContainer),
    trackColor: MaterialStateProperty.all(darkColorScheme.secondaryContainer),
  ),
);
