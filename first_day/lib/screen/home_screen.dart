import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartPressed() {
    DateTime now = DateTime.now();
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white.withOpacity(0.5),
            height: 300.0,
            child: CupertinoDatePicker(
              // 한계 날짜를 정해줌
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime(
                now.year,
                now.month,
                now.day,
              ),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  // 받아오는 date와, 선언한 selectedDate
                  selectedDate = date;
                });
              },
            ),
            // 특정 위젯이 어디에 정렬해야하는지 알 수 없으면 최대한으로 사이즈를 먹음
          ),
        );
      },
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset('asset/images/couple.png'),
    );
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;
  // 변경되는 Date를 selectedDate로 업데이트 함
  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final now =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('You & I', style: theme.textTheme.headline1,),
          Column(children: [
            Text(
              '우리 처음 만난 날',
              style: theme.textTheme.bodyText1,
            ),
            Text(
                '${selectedDate.year}. ${selectedDate.month}. ${selectedDate.day}',
                style: theme.textTheme.bodyText2),
          ]),
          IconButton(
            iconSize: 50.0,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.pink[400],
            ),
          ),
          Text(
              'D+${DateTime(now.year, now.month, now.day).difference(selectedDate).inDays + 1}',
              style: theme.textTheme.headline2)
        ],
      ),
    );
  }
}
