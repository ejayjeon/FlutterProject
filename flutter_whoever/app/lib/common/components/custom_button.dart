import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final ValueNotifier themeNotifier;
  final bool subStyle;
  final String buttonText;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.themeNotifier,
    this.subStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: themeNotifier.value == ThemeMode.light
          ? !subStyle
              ? lightButtonTheme
              : darkButtonTheme
          : !subStyle
              ? darkButtonTheme
              : lightButtonTheme,
      onPressed: onPressed,
      child: Text(
        buttonText,
      ),
    );
  }
}
