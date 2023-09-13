import 'dart:async';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whoever/app/common/util/util.dart';

class HiveService extends GetxService {
  static late final Box<Map<String, dynamic>> box;
  Future<HiveService> init() async {
    await Hive.initFlutter().then(openDataBase);
    return this;
  }

  // 1. 박스 오픈
  static Future<Box> openDataBase(value) async {
    Map<String, dynamic> deviceInfo = await getDeviceInfo();
    box = await Hive.openBox('${deviceInfo['identifier']}');
    Log(box.path);
    return box;
  }

  // 2. box.put(key, value) : 데이터베이스 저장
  static Future<void> add(Map<String, dynamic> T) async {
    if (box.get(T) == null) {
      await box.add(T);
    }
  }

  // 3-1. box.get(key) : UUID로 저장된 파일 가져오기
  static Future<Map<String, dynamic>?> getById(String uuid) async {
    return box.get(uuid);
  }

  // 3-2. box.getAll : 저장된 전체 리스트 가져오기
  static Future<List> getAll() async {
    return box.values.toList();
  }

  // 4. box.putAt(index, T) : 데이터베이스 업데이트
  static Future<void> update(String uuid, Map<String, dynamic> T) async {
    await box.putAt(
      box.values.firstWhere((e) => e['uuid'] == uuid)[uuid],
      T,
    );
  }

  // 5-1. box.delete() : 데이터베이스에서 지정한 데이터 지우기
  static Future<void> delete(String uuid) async {
    if (box.values.where((e) => e['uuid'] == uuid).isNotEmpty) {
      await box.delete(box.values.firstWhere((e) => e['uuid'] == uuid)[uuid]);
    }
  }

  // 5-2. box.deleteAll(): 전체 데이터 삭제
  static Future<void> deleteAll() async {
    await box.clear();
  }

  // 6. 박스 닫기
  static Future<void> closeDataBase() async {
    if (box.isNotEmpty) {
      await box.close();
    }
  }
}
