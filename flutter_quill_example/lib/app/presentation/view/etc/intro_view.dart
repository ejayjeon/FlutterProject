import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      needBottomNavigationBar: false,
      needDrawer: false,
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/illu16.png',
              width: Get.width / 2,
            ),
            SizedBox(height: 16.h),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}