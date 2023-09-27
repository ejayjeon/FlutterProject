import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/widget/custom_bottom_sheet.dart';
import 'package:whoever/app/core/util/utils.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: Routes.BOOK.replaceAll(RegExp('/'), '').toUpperCase(),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('${Routes.BOOK}${Routes.BOOK_STORY_EDIT}');
                // customBottomSheet(
                //   title: 'dd',
                //   content: ListView(
                //     children: [
                //       Image.asset(
                //         'assets/image/illu16.png',
                //         fit: BoxFit.cover,
                //       ),
                //       Text('ddd'),
                //     ],
                //   ),
                //   height: 300,
                // );
              },
              child: Text('CLICK'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('${Routes.BOOK}${Routes.BOOK_STORY_LIST}');
              },
              child: Text('리스트뷰'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('${Routes.BOOK}/12');
              },
              child: Text('12'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('${Routes.BOOK}/34');
              },
              child: Text('34'),
            ),
          ],
        ),
      ),
      needBottomNavigationBar: true,
    );
  }
}
