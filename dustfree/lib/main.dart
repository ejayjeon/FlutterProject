import 'package:dustfree/model/stat_model.dart';
import 'package:dustfree/screen/home_screen.dart';
import 'package:dustfree/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const id = 'dustFree';

void main() async {
  // 하이브 데이터베이스 이용하기
  await Hive.initFlutter();

  Hive.registerAdapter<StatModel>(StatModelAdapter());
  Hive.registerAdapter<ItemCode>(ItemCodeAdapter());

  await Hive.openBox(id); // 앱의 dustFree 라는 로컬 데이터베이스가 생성되어서 언제든지 데이터를 넣고 뺄 수 있다

  for (ItemCode itemCode in ItemCode.values) {
    await Hive.openBox<StatModel>(itemCode.name); // 제네릭 사용
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SurroundAir',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/main': (context) => const MainScreen(),
        // '/calendar': (context) => CalendarScreen(),
      },
    ),
  );
}
