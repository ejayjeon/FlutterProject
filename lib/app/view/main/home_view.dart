import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/view/book/book_card.dart';

class HomeView extends GetView<AppController> {
  HomeView({super.key}) {
    controller.getThemeStatus();
  }
  final bookTitle = [
    '도시와 그 불확실한 벽',
    '비가 오면 열리는 상점',
    '메리골드 마음 세탁소',
    '어리석은 장미',
    '달의 아이',
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: Routes.HOME.replaceAll(RegExp('/'), '').toUpperCase(),
      onSearchPressed: () {
        controller.changeTheme();
      },
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(title: '나의 서재'),
            _topPart(index: 5),
            SizedBox(height: 36.h),
            _header(title: '오늘의 책'),
            _bottomPart(
              description: 'Contents',
              index: 5,
            ),
          ],
        ),
      ),
      needBottomNavigationBar: true,
      needFloatingActionButton: true,
      onFabPressed: () {},
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

  Widget _topPart({
    required int index,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            index,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: BookCard(
                imagePath: 'assets/image/book_${index + 1}.jpeg',
                width: 200,
                title: bookTitle[index],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Log('click');
            },
            child: SvgPicture.asset(
              'assets/icon/ic_add.svg',
              width: 100,
              fit: BoxFit.cover,
              color: Get.isDarkMode
                  ? darkTheme.disabledColor
                  : lightTheme.disabledColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomPart({
    required String description,
    required int index,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          index,
          (index) => IntrinsicHeight(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BookCard(
                    imagePath: 'assets/image/book_${index + 1}.jpeg',
                    width: 150,
                    title: bookTitle[index],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        bookTitle[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
