// ignore_for_file: unused_import

import 'package:dayxday/pages/calendarpage.dart';
import 'package:dayxday/pages/detailpage.dart';
import 'package:dayxday/pages/historypage.dart';
import 'package:dayxday/pages/searchpage.dart';
import 'package:dayxday/pages/simplepage.dart';
import 'package:get/get.dart';
import 'package:dayxday/pages/homepage.dart';

class Routers {
  static final routes = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/simpletodo', page: () => SimplePage()),
    GetPage(name: '/calendartodo', page: () => CalendarPage()),
    GetPage(name: '/history', page: () => HistoryPage()),
    GetPage(name: '/search', page: () => SearchPage()),
    GetPage(name: '/detail/:id', page: () => DetailPage()),
  ];
}
