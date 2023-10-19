import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future customBottomSheet({
  String? title,
  Widget? content,
  VoidCallback? onTap,
  double? height,
}) async {
  return showModalBottomSheet(
    context: Get.context!,
    builder: (context) {
      return Container(
        width: context.mediaQuerySize.width,
        height: height ?? context.mediaQuerySize.height * 0.3,
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close_sharp,
                  ),
                ),
              ],
            ),
            Text(title!),
            Expanded(
              child: content!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(Get.context!).pop();
                  },
                  child: Text('취소'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('확인'),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
