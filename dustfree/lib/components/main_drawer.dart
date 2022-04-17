import 'package:dustfree/const/colors.dart';
import 'package:flutter/material.dart';

const regions = [
  '서울',
  '경기',
  '대구',
  '충남',
  '인천',
  '대전',
  '경북',
  '세종',
  '광주',
  '전북',
  '강원',
  '울산',
  '전남',
  '부산',
  '제주',
];

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: defaultBgLight,
      child: ListView(
        children: [
          DrawerHeader(
            curve: Curves.easeInCubic,
            child: Text(
              '지역 선택',
              style: TextStyle(
                color: fontLight,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                // fontFamily: 'SurroundAir',
              ),
            ),
          ),
          // cascading operator : map을 List로 해버린 상태에서 리스트 안에 들어간 꼴이 되니까 ...로 리스트에서 꺼내줘야 함
          ...regions
              .map(
                (e) => ListTile(
                  tileColor: fontLight,
                  selectedTileColor: defaultBgLight,
                  selectedColor: fontDark,
                  selected: e == '경기',
                  onTap: () {},
                  title: Text(e),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
