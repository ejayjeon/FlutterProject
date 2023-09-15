import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(title: '나의 서재'),
          _topPart(),
          _header(title: '오늘의 책'),
          ...List.generate(
            5,
            (index) => _bottomPart(
              title: '보보경심',
              description: '청나라로 타임슬립한 2016년 장샤오의, 마이태 약희 생존기',
              index: index,
            ),
          ),
        ],
      ),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) => _renderBox(index)),
      ),
    );
  }

  Widget _bottomPart({
    required String title,
    required String description,
    required int index,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _renderBox(index),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
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
    );
  }

  Widget _renderBox(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150.w,
        height: 200.w,
        decoration: BoxDecoration(
          color: Colors.green[100 * (index % 9)],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(index.toString()),
        ),
      ),
    );
  }
}
