import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nosh/common/components/custom_text_form_field.dart';
import 'package:nosh/common/const/custom_theme.dart';

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
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              hintText: 'Email',
              obscure: false,
              autoFocus: true,
              onChanged: (String value) {},
            ),
            CustomTextFormField(
              hintText: 'Password',
              obscure: true,
              autoFocus: true,
              onChanged: (String value) {},
            ),
          ],
        ),
      ),
    );
  }
}
