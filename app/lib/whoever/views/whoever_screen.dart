import 'package:app/common/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WhoeverScreen extends StatelessWidget {
  static String get routeName => 'whoever';
  final ValueNotifier themeNotifier;
  const WhoeverScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      needFab: true,
      fabIcon: Icons.add,
      body: Center(
        child: Text(
          'WHOEVER',
        ),
      ),
    );
  }
}
