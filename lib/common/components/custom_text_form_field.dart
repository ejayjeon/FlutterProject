import 'package:flutter/material.dart';
import 'package:nosh/common/const/color_schemes.g.dart';
import 'package:nosh/common/const/custom_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.obscure = false,
    this.autoFocus = false,
    required this.onChanged,
    this.prefixIcon,
  });

  final String? hintText;
  final String? errorText;
  final bool obscure;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: lightColorScheme.primary,
      obscureText: obscure,
      autofocus: autoFocus,
      onChanged: onChanged,
      decoration: lightInputThemeData.copyWith(
        icon: Icon(prefixIcon),
        hintText: hintText,
        errorText: errorText,
        filled: true,
      ),
    );
  }
}
