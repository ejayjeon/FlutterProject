import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

void Log(dynamic message) {
  if (kDebugMode) {
    return print(
      '🚀 ~ [${DateFormat('y/MM/dd H:mm:ss').format(DateTime.now())}] ${message.toString()}',
    );
  }
}
