import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';

class SettingDetailView extends GetView {
  const SettingDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: Get.currentRoute.toUpperCase(),
      onWillpopSetting: {
        'title': '돌아가기',
        'content': 'page-back'.tr,
        'to': '/setting',
      },
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.amber,
        child: Center(
          child: Text(Get.currentRoute.toUpperCase()),
        ),
      ),
    );
  }
}
