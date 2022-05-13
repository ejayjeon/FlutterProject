import 'package:dustfree/const/colors.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({required this.bgColor, required this.title, Key? key})
      : super(key: key);
  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    const ts =
        TextStyle(color: fontDark, fontSize: 20.0, fontWeight: FontWeight.bold);
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          )),
      child: Text(
        title,
        style: ts,
      ),
    );
  }
}
