import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Log(String message) {
  final routeName = Get.currentRoute.toString();
  if (kDebugMode) {
    return print(
      '🚀 ~ [${DateFormat('y/MM/dd H:mm:ss').format(DateTime.now())}] ${message}',
    );
  }
}
