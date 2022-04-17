import 'package:dustfree/const/colors.dart';
import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.w700, color: fontLight);
    final now = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    const boxPadding = SizedBox(
      height: 16.0,
    );
    return SliverAppBar(
      backgroundColor: defaultBg,
      // 앱바가 늘어날 수 있는 공간
      expandedHeight: 500,
      // 앱을 스크롤하면 사라질 수 있는 공간 : flexible-space
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            //The height of the toolbar component of the [AppBar]
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  '서울',
                  style: ts,
                ),
                boxPadding,
                Text(
                  now.toString().substring(0, 10),
                  style: ts.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                boxPadding,
                Image.asset(
                  'assets/img/noto_default.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
                boxPadding,
                Text(
                  '보통',
                  style: ts,
                ),
                boxPadding,
                Text(
                  '나쁘지 않네요!',
                  style:
                      ts.copyWith(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
