import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nosh/common/components/custom_text_form_field.dart';
import 'package:nosh/common/const/custom_theme.dart';
import 'package:nosh/common/view/splash_screen.dart';
import 'package:nosh/user/view/login_screen.dart';

void main() {
  runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
      home: const SplachScreen(),
    );
  }
}
