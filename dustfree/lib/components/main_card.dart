import 'package:dustfree/const/colors.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({required this.child, required this.bgColor, Key? key})
      : super(key: key);
  final Widget child;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      color: bgColor,
      elevation: 0,
      child: child,
    );
  }
}
