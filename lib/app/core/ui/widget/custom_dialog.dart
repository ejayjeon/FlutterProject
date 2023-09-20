import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';

Future<void> showConfirmDialog({
  String? title,
  String? content,
  VoidCallback? onOkPressed,
}) async {
  return showDialog(
    context: Get.context!,
    builder: (_) {
      return AlertDialog(
        actionsPadding: EdgeInsets.only(right: 10.w, bottom: 10.w),
        contentPadding: EdgeInsets.all(8.0.sp),
        actionsAlignment: MainAxisAlignment.end,
        scrollable: false,
        content: Container(
          width: Get.width * 0.8,
          height: Get.height * 0.1,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title ?? '',
                style: customHeader,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Text(
                  content ?? '',
                  style: customBody,
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('cancel'.tr),
              ),
              TextButton(
                onPressed: onOkPressed ??
                    () {
                      exit(0);
                    },
                child: Text('ok'.tr),
              ),
            ],
          ),
        ],
      );
    },
  );
}
