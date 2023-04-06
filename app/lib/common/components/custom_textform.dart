import 'package:app/common/theme/color_schemes.g.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextForm extends StatelessWidget {
  final ValueNotifier themeNotifier;
  final String? hint; // 힌트텍스트
  final String? error; // 에러텍스트
  final bool isPwd; // 비밀번호냐 아니냐?
  final bool isAutoFocused; // 자동 포커스 여부?
  final ValueChanged<String> onChanged;
  const CustomTextForm({
    super.key,
    this.hint = '힌트를 입력해주세요',
    this.error,
    this.isPwd = false,
    this.isAutoFocused = false,
    required this.themeNotifier,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPwd,
      autofocus: isAutoFocused,
      onChanged: onChanged,
      cursorColor: themeNotifier.value == ThemeMode.light
          ? lightColorScheme.primary
          : darkColorScheme.primary,
      decoration: themeNotifier.value == ThemeMode.light
          ? lightInputTheme.copyWith(
              hintText: hint,
              errorText: error,
            )
          : darkInputTheme.copyWith(
              hintText: hint,
              errorText: error,
            ),
    );
  }
}
