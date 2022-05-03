import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;
  // 홈스크린으로부터 받는 값
  const SettingsScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 100;

  @override
  void initState() {
    // 빌드가 실행되기 전의 값
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
    // 이전에는 stateful 위젯과 State를 모두 다시 생성한다.
    // initState가 실행이 되는 순간에 기존에 widget 파라미터에 넣어두었던 값을 갈아치운다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: PRIMARY_COLOR,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _body(maxNumber: maxNumber),
                _footer(
                  onButtonPressed: onButtonPressed,
                  maxNumber: maxNumber,
                  onSlideChanged: valueChange,
                )
              ],
            ),
          ),
        ));
  }

  onButtonPressed() {
    // 뒤로가기 -> 데이터 저장 -> 파라미터로 보내줌
    Navigator.of(context).pop(maxNumber.toInt());
  }

  void valueChange(double val) {
    setState(() {
      maxNumber = val;
      print(maxNumber);
    });
  }
}

class _body extends StatelessWidget {
  const _body({
    Key? key,
    required this.maxNumber,
  }) : super(key: key);

  final double maxNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: maxNumber
            .toInt()
            .toString()
            .split('')
            .map((e) => Image.asset(
                  'assets/images/$e.png',
                  height: 70.0,
                  width: 50.0,
                ))
            .toList(),
      ),
    );
  }
}

class _footer extends StatelessWidget {
  final VoidCallback onButtonPressed;
  final ValueChanged<double>? onSlideChanged;
  final double maxNumber;
  _footer(
      {required this.onButtonPressed,
      required this.maxNumber,
      required this.onSlideChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 0,
          max: 100,
          onChanged: onSlideChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(primary: RED_COLOR),
          child: const Text('저장'),
        ),
      ],
    );
  }
}
