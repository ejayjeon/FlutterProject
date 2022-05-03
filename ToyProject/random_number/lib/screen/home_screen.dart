import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 100;
  List<int> randomNumbers = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(onPressed: setNumber),
              _body(randomNumbers: randomNumbers),
              _footer(
                onPressed: onPressBtn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressBtn() {
    // 랜덤 숫자
    final rand = Random();
    // 중복숫자방지
    final Set<int> newNumbers = {};
    while (newNumbers.length != 6) {
      final number = rand.nextInt(maxNumber);
      newNumbers.add(number);
    }
    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }

  void setNumber() async {
    //MediaQuery.of(context)
    // push : list의 Add와 같은 기능
    // [HomeScreen(), SettingsScreen()]
    // 언젠가 받을 값이므로 await로 받아줘야 한다
    final int? result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingsScreen(
            maxNumber: maxNumber,
          );
        },
      ),
    );
    // 이렇게 받아온 값을 화면에 띄우면 됨
    // 널 가능성이 있음
    if (result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }
}

class _footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _footer({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: RED_COLOR, onSurface: BLUE_COLOR),
        onPressed: onPressed,
        child: const Text('생성'),
      ),
    );
  }
}

class _body extends StatelessWidget {
  const _body({
    Key? key,
    required this.randomNumbers,
  }) : super(key: key);

  final List<int> randomNumbers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // State 변수로 생성
        children: randomNumbers
            .asMap()
            .entries
            .map(
              (e) => Padding(
                // 열의 마지막 숫자면 패딩을 넣지 않는다? asMap().entries를 한 순간 key를 가지고 올 수 있다
                // 인덱스의 마지막 번째 !== ? :
                padding: EdgeInsets.only(bottom: e.key == 5 ? 0 : 16.0),
                child: Row(
                  children: e.value
                      .toString()
                      .split('')
                      .map((y) => Image.asset(
                            'assets/images/$y.png',
                            height: 70.0,
                            width: 50.0,
                          ))
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _header extends StatelessWidget {
  final VoidCallback onPressed;
  const _header({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Random',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}
