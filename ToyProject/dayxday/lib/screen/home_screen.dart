import 'package:dayxday/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: getGradient(),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/calendar');
                  },
                  child: Text(
                    'Day X Day',
                    style: (TextStyle(
                        color: veryperi,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _InputPwd(),
                      _InputPwd(),
                      _InputPwd(),
                      _InputPwd(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/calendar');
                  },
                  child: Image.asset('asset/img/couple.png', width: 200.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // bool onCheckPut(int inputVal) {
  //   if (inputVal > 0 || inputVal < 10) return isPut;
  // }
}

class _InputPwd extends StatelessWidget {
  const _InputPwd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 70.0,
      child: TextFormField(
        validator: (String? val) {
          if (val == null || val.isEmpty) {
            return '값을 입력해주세요';
          }
          if (val.isNotEmpty) {
            int num = int.parse(val);

            if (num > 9) return '숫자는 9보다 클 수 없습니다';
            if (num < 0) return '숫자는 0보다 작을 수 없습니다';
          }
          return null;
        },
        cursorColor: veryperi,
        initialValue: null,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        autofocus: true,
        autocorrect: true,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.transparent),
          focusColor: veryperi,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          filled: false,
        ),
      ),
    );
  }
}

BoxDecoration getGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [azure, blueViolet, lilac],
    ),
  );
}
