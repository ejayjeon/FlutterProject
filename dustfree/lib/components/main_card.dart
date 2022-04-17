import 'package:dustfree/const/colors.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({required this.child, Key? key}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      color: defaultBgLight,
      elevation: 0,
      child: child,
    );
  }
}
