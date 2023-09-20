import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:whoever/app/core/ui/theme/color_schemes.g.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Pretendard',
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
  inputDecorationTheme: InputDecorationTheme(
    focusColor: darkColorScheme.tertiary,
    iconColor: darkColorScheme.primary,
    fillColor: darkColorScheme.surfaceVariant,
    isCollapsed: true,
    contentPadding: const EdgeInsets.all(8.0),
    errorMaxLines: 1,
    hintStyle: const TextStyle(
      fontSize: 12.0,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightColorScheme.primary,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: darkColorScheme.primaryContainer,
        width: 1.0,
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Pretendard',
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

  inputDecorationTheme: InputDecorationTheme(
    focusColor: lightColorScheme.tertiary,
    iconColor: lightColorScheme.primary,
    fillColor: lightColorScheme.surfaceVariant,
    isCollapsed: true,
    contentPadding: const EdgeInsets.all(8.0),
    errorMaxLines: 1,
    hintStyle: const TextStyle(
      fontSize: 12.0,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: darkColorScheme.primary,
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightColorScheme.primaryContainer,
        width: 1.0,
      ),
    ),
  ),
);

final customHeader = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 24.sp,
);

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: Color.fromRGBO(234, 239, 243, 1),
  ),
);
