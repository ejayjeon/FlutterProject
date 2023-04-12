import 'package:app/common/layout/main_layout.dart';
import 'package:app/common/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PrivateScree extends StatelessWidget {
  static String get routeName => 'private';
  final ValueNotifier themeNotifier;
  const PrivateScree({
    super.key,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      needFab: true,
      fabIcon: Icons.add,
      fabPressed: () {},
      body: Center(
        child: Text(
          'PRIVATE',
        ),
      ),
    );
  }
}
