import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: Routes.SETTING.replaceAll(RegExp('/'), '').toUpperCase(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(title: '프로필'),
            _topPart(),
            SizedBox(height: 36.h),
            _header(title: '설정'),
            _bottomPart(),
          ],
        ),
      ),
      needBottomNavigationBar: true,
    );
  }

  Widget _header({
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: customHeader,
      ),
    );
  }

  Widget _topPart() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height / 3.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/image/avatar_5.png'),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              radius: 80,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'JEMMA JEON',
                      style: customHeader,
                    ),
                    Text(
                      'Hello world, My name is Jeon Jemma! \n Nice to meet you!',
                      style: customBody,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomPart() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          5,
          (index) => GestureDetector(
            onTap: () {
              Get.toNamed('${Routes.SETTING}/$index');
            },
            child: ListTile(
              title: Text(
                '메뉴 타이틀 $index',
                style: customHeader.copyWith(fontSize: 18.sp),
              ),
              subtitle: Text(index.toString()),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ),
    );
  }

  // SliverPadding _topProfile() {
  //   return SliverPadding(
  //     padding: const EdgeInsets.all(8.0),
  //     sliver: SliverToBoxAdapter(
  //       child: Container(
  //         height: 100.h,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(8.0),
  //           color: lightTheme.primaryColor,
  //         ),
  //         child: Text('....'),
  //       ),
  //     ),
  //   );
  // }

  // SliverPadding _bottomList() {
  //   return SliverPadding(
  //     padding: const EdgeInsets.all(8.0),
  //     sliver: SliverList.builder(
  //       itemCount: 10,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           title: Text('title'),
  //           subtitle: Text('subtitle'),
  //         );
  //       },
  //     ),
  //   );
  // }
}
