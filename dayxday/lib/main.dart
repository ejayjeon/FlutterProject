import 'package:dayxday/database/drift_db.dart';
import 'package:dayxday/screen/calendar_screen.dart';
import 'package:dayxday/screen/home_screen.dart';
import 'package:dayxday/theme/theme.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:dayxday/database/drift_db.dart';

const DEFAULT_CATE = [
  'book',
  'pencil',
  'call',
  'cinema',
  'paint',
  'coding',
  'coffee',
  'eat',
  'exercising',
  'game',
  'gold',
  'hand',
  'heart',
  'money',
  'stock',
  'meeting',
  'travel',
  'work'
];

void main() async {
  // RunApp 실행 전에 다른 코드를 실행해야 한다면, 그 앱이 실행되기 전에 보증을 해주는 것
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  // db를 인스턴스화
  final database = LocalDb();

// GetIt 패키지의 인스턴스
  GetIt.I.registerSingleton<LocalDb>(database);

  final categories = await database.getCategoryName();
  if (categories.isEmpty) {
    for (String category in DEFAULT_CATE) {
      await database.createCategoryName(
        CategoryNameCompanion(
          category: Value(category),
        ),
      );
    }
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'modu',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/calendar': (context) => CalendarScreen(),
      },
    ),
  );
}
