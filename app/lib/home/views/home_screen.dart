import 'package:app/common/components/custom_textform.dart';
import 'package:app/common/layout/main_layout.dart';
import 'package:app/common/theme/color_schemes.g.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  static String get routeName => 'home';
  final ValueNotifier themeNotifier;
  const HomeScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      fab: FloatingActionButton(
        elevation: 0,
        backgroundColor: themeNotifier.value == ThemeMode.light
            ? lightColorScheme.primary
            : darkColorScheme.primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
      body: Center(
        child: Container(
          child: Text(
            '홈',
          ),
        ),
      ),
    );
  }
}
