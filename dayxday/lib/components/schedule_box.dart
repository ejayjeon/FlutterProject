import 'package:dayxday/theme/theme.dart';
import 'package:flutter/material.dart';

class ScheduleBox extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color color;
  final String category;
  const ScheduleBox(
      {required this.startTime,
      required this.endTime,
      required this.content,
      required this.color,
      required this.category,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: veryperi,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            // 가장 높이가 높은 위젯이 차지한 부분만큼 늘어남
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Time(
                  startTime: startTime,
                  endTime: endTime,
                ),
                // SizedBox(
                //   width: 4.0,
                // ),
                const SizedBox(width: 8.0),
                _Content(content: content),
                _Category(color: color, category: category),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final int startTime;
  final int endTime;
  const _Time({required this.startTime, required this.endTime, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${startTime.toString().padLeft(2, '0')}:00',
            style: textStyle(20.0),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            '${endTime.toString().padLeft(2, '0')}:00',
            style: textStyle(14.0),
          ),
        ],
      ),
    );
  }

  TextStyle textStyle(double t) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: t,
      color: veryperi,
    );
  }
}

class _Content extends StatelessWidget {
  final String content;
  const _Content({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        content,
        style: TextStyle(fontSize: 15.0, color: fontBlack),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  final Color color;
  final String category;
  const _Category({required this.color, required this.category, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'asset/img/${category}.png',
        color: color,
      ),
      width: 16.0,
      height: 16.0,
    );
  }
}
