import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserScreen extends StatelessWidget {
  static String get routeName => 'user';
  final ValueNotifier themeNotifier;
  const UserScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '유저',
        ),
      ),
    );
  }
}
