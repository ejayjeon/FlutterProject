import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:whoever/app/core/util/typedef.dart';

void Log(dynamic message) {
  if (kDebugMode) {
    return print(
      '🚀 ~ [${DateFormat('y/MM/dd H:mm:ss').format(DateTime.now())}] ${message.toString()}',
    );
  }
}

numberFormat(dynamic data) {
  return NF('###,###,###,###').format(data);
}

numberFormatCurrency(dynamic data) {
  return NF.currency(locale: 'ko_KR', symbol: '₩');
}
