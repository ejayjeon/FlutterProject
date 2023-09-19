import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/widget/custom_bottom_sheet.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                customBottomSheet(
                  title: 'dd',
                  content: ListView(
                    children: [
                      Image.asset(
                        'assets/image/illu16.png',
                        fit: BoxFit.cover,
                      ),
                      Text('ddd'),
                    ],
                  ),
                  height: 300,
                );
              },
              child: Text('CLICK'),
            )
          ],
        ),
      ),
      needBottomNavigationBar: true,
    );
  }
}
