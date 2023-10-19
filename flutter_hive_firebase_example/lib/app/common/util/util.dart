import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Log(dynamic message) {
  final routeName = Get.currentRoute.toString();
  if (kDebugMode) {
    return print(
      '🚀 ~ [${DateFormat('y/MM/dd H:mm:ss').format(DateTime.now())}] ${message.toString()}',
    );
  }
}

Future<Map<String, dynamic>> getDeviceInfo() async {
  String? deviceModel;
  String? deviceVersion;
  String? identifier;
  final deviceInfo = DeviceInfoPlugin();

  try {
    if (Platform.isIOS) {
      var ios = await deviceInfo.iosInfo;
      deviceModel = ios.name;
      deviceVersion = ios.systemVersion;
      identifier = ios.identifierForVendor;
    } else if (Platform.isAndroid) {
      var android = await deviceInfo.androidInfo;
      deviceModel = android.model;
      deviceVersion = android.version.release;
      identifier = android.id;
    } else if (Platform.isMacOS) {
    } else {}
  } on PlatformException {
    Log('ERROR');
  }
  return {
    'deivceModel': deviceModel,
    'deviceVersion': deviceVersion,
    'identifier': identifier,
  };
}
