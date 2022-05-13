import 'package:dustfree/const/colors.dart';
import 'package:dustfree/const/regions.dart';
import 'package:flutter/material.dart';

typedef OnRegionTap = void Function(String region);

class MainDrawer extends StatelessWidget {
  final OnRegionTap onRegionTap;
  final String selectedRegion;
  final Color darkColor;
  final Color lightColor;
  const MainDrawer(
      {required this.onRegionTap,
      required this.selectedRegion,
      required this.darkColor,
      required this.lightColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          const DrawerHeader(
            curve: Curves.easeInCubic,
            child: Text(
              '지역 선택',
              style: TextStyle(
                color: fontDark,
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
                  selectedTileColor: lightColor,
                  selectedColor: fontDark,
                  selected: e == selectedRegion,
                  onTap: () {
                    onRegionTap(e);
                    // 여기서 Navigator.of(context).pop() 해줘도 되지만, 상위에서 state 관리를 해주기 위해서
                  },
                  title: Text(e),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
