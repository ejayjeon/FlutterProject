import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  const StatBox(
      {required this.category,
      required this.imgPath,
      required this.level,
      required this.stat,
      required this.width,
      Key? key})
      : super(key: key);
  final String category; // 미세먼지, 초미세먼지, 이산화질소
  final String imgPath; // 아이콘의 위치(경로)
  final String level; // 오염 정도
  final String stat; // 오염 수치
  final double width; // 너비

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(category),
          Image.asset(
            imgPath,
            width: MediaQuery.of(context).size.width / 5,
          ),
          Text(level),
          Text(stat),
        ],
      ),
    );
  }
}
