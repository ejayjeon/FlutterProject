import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/ui/theme/color_schemes.g.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final double height;
  final IconData? iconPath;
  final String label;
  const CustomButtonWidget({
    super.key,
    this.onPressed,
    this.height = 50.0,
    this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height),
          color: controller.changeColor(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              Icon(iconPath),
            ],
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends CustomButtonWidget {
  const CustomButton.active({
    required String label,
    required VoidCallback onPressed,
    super.key,
  }) : super(
          label: label,
          onPressed: onPressed,
        );
}
