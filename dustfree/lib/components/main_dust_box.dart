import 'package:dustfree/components/card_title.dart';
import 'package:dustfree/components/main_card.dart';
import 'package:flutter/material.dart';

class MainDustBox extends StatelessWidget {
  const MainDustBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            title: '시간별 미세먼지',
          ),
          Column(
            children: List.generate(
              24,
              (idx) {
                final now = DateTime.now().hour;
                int currentHour = idx - now; // asc 정렬을 위해
                if (currentHour < 0) {
                  currentHour += 24;
                }
                // if (currentHour > 0 || currentHour < 10) {
                //   currentHour.toString().padLeft(2, '0');
                // }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      // mainAxixAlignment 대신 각자 위젯을 Expanded로 감싸준 이유는 글자수에 따라 아이콘의 정렬이 비뚤비뚤하기 때문
                      Expanded(child: Text('$currentHour시')),
                      Expanded(
                        child: Image.asset(
                          'assets/img/noto_ng3.png',
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '좋음',
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
