import 'package:dayxday/theme/theme.dart';
import 'package:flutter/material.dart';

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
                flex: 1,
                child: Text(
                  'Day x Day',
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/calendar');
                },
                child: Text('ENTER'),
              ),
              Expanded(
                child: Image.asset('asset/img/couple.png', width: 200.0),
              ),
            ],
          ),
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
      colors: [azure, mint, appleGreen],
    ),
  );
}
