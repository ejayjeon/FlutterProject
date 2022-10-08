import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nosh/common/const/color_schemes.g.dart';

class CustomElevatedBtn extends StatelessWidget {
  CustomElevatedBtn({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = PRIMARY_CONTAINER,
  });

  final VoidCallback onPressed;
  final Widget child;
  Color? backgroundColor;

  static const PRIMARY_CONTAINER = Color(0xFFD8E2FF);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      clipBehavior: Clip.none,
      child: child,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color?>(
          backgroundColor,
        ),
      ),
    );
  }
}
