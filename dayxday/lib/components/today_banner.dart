import 'package:dayxday/database/drift_db.dart';
import 'package:dayxday/model/scheduleWithCate.dart';
import 'package:dayxday/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;

  const TodayBanner({required this.selectedDay, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getGradient(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',
              style: textStyle(20.0),
            ),
            StreamBuilder<List<ScheduleWithCate>>(
                stream: GetIt.I<LocalDb>().watchSchedules(selectedDay),
                builder: (context, snapshot) {
                  int count = 0;
                  if (snapshot.hasData) {
                    count = snapshot.data!.length;
                  }
                  return Text(
                    '${count}개',
                    style: textStyle(14.0),
                  );
                }),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle(double t) {
    return TextStyle(
      fontSize: t,
      color: fontColor,
    );
  }

  BoxDecoration getGradient() {
    return const BoxDecoration(
      // gradient: LinearGradient(
      //   begin: Alignment.centerLeft,
      //   end: Alignment.centerRight,
      //   colors: [azure, blueViolet, lilac],
      // ),
      color: veryperi,
    );
  }
}
