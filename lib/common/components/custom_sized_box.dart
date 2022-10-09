import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  CustomSizedBox({super.key, this.height, this.width});

  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
