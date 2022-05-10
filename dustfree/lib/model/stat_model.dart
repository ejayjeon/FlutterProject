// 모델링 할 때는 무조건 class를 사용함 = key 값들을 가져옴
import 'dart:convert';

import 'package:dustfree/utils/data_utils.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'stat_model.g.dart';

@HiveType(typeId: 2)
enum ItemCode {
  @HiveField(0)
  PM10, // 미세먼지
  @HiveField(1)
  PM25, // 초미세먼지
  @HiveField(2)
  NO2, // 이산화질소
  @HiveField(3)
  O3, // 오존
  @HiveField(4)
  CO, // 일산화탄소
  @HiveField(5)
  SO2, // 아황산가스
}

// 타입id는 절대로 중복되면 안된다
@HiveType(typeId: 1)
class StatModel {
  @HiveField(0) // 타입 안에서는 절대적인 인덱스
  final double daegu;
  @HiveField(1)
  final double chungnam;
  @HiveField(2)
  final double incheon;
  @HiveField(3)
  final double daejeon;
  @HiveField(4)
  final double gyeongbuk;
  @HiveField(5)
  final double gangwon;
  @HiveField(6)
  final double sejong;
  @HiveField(7)
  final double gwangju;
  @HiveField(8)
  final double jeonbuk;
  @HiveField(9)
  final double ulsan;
  @HiveField(10)
  final double jeonnam;
  @HiveField(11)
  final double seoul;
  @HiveField(12)
  final double busan;
  @HiveField(13)
  final double jeju;
  @HiveField(14)
  final double chungbuk;
  @HiveField(15)
  final double gyeongnam;
  @HiveField(16)
  final double gyeonggi;
  @HiveField(17)
  final DateTime dateTime;
  @HiveField(18)
  final ItemCode itemCode; // enum

// Hive Generation이 있어야하기 위해서는 기본 Constructor가 있어야함
  StatModel({
    required this.daegu,
    required this.chungnam,
    required this.incheon,
    required this.daejeon,
    required this.gyeongbuk,
    required this.gangwon,
    required this.sejong,
    required this.gwangju,
    required this.jeonbuk,
    required this.ulsan,
    required this.jeonnam,
    required this.seoul,
    required this.busan,
    required this.jeju,
    required this.chungbuk,
    required this.gyeongnam,
    required this.gyeonggi,
    required this.dateTime,
    required this.itemCode,
  });

// 컨스트럭트가 아니라 Json 형태에서부터 데이터를 받아오기 위해 작성 = 일종의 컨벤션
  StatModel.fromJson({required Map<String, dynamic> json})
      :
        // 아래 값들은 기본적으로 Json에서 String 형태로 들어오게 되어있음 -> 이 String 값을 읽어들이고 double로 형변환을 하겠다는 의미
        daegu = double.parse(json["daegu"] ??
            '-'), // null일 경우 - 값으로 처리해 (나중에, - 값일 경우 상태가 좋은 걸로 가정)
        chungnam = double.parse(json["chungnam"] ?? '0'),
        incheon = double.parse(json["incheon"] ?? '0'),
        daejeon = double.parse(json["daejeon"] ?? '0'),
        gyeongbuk = double.parse(json["gyeongbuk"] ?? '0'),
        sejong = double.parse(json["sejong"] ?? '0'),
        gwangju = double.parse(json["gwangju"] ?? '0'),
        jeonbuk = double.parse(json["jeonbuk"] ?? '0'),
        gangwon = double.parse(json["gangwon"] ?? '0'),
        ulsan = double.parse(json["ulsan"] ?? '0'),
        jeonnam = double.parse(json["jeonnam"] ?? '0'),
        seoul = double.parse(json["seoul"] ?? '0'),
        busan = double.parse(json["busan"] ?? '0'),
        jeju = double.parse(json["jeju"] ?? '0'),
        chungbuk = double.parse(json["chungbuk"] ?? '0'),
        gyeongnam = double.parse(json["gyeongnam"] ?? '0'),
        gyeonggi = double.parse(json["gyeonggi"] ?? '0'),
        dateTime = DateTime.parse(json["dataTime"]),
        // Enum을 가져오기 위해 함수 추가
        itemCode = parseItemCode(json["itemCode"]);
  // enum 값을 가져오기 위한 parseItemCode 함수
  static ItemCode parseItemCode(String raw) {
    if (raw == 'PM2.5') {
      return ItemCode.PM25;
    }
    // 첫 번째 값들 = enum의 값의 이름들을 가져와라
    return ItemCode.values.firstWhere((e) => e.name == raw);
  }

// region이 어떤 값인지 알 수 있게
  double getLevelFromRegion(String region) {
    if (region == '서울') {
      return seoul;
    } else if (region == '경기') {
      return gyeonggi;
    } else if (region == '대구') {
      return daegu;
    } else if (region == '충남') {
      return chungnam;
    } else if (region == '인천') {
      return incheon;
    } else if (region == '대전') {
      return daejeon;
    } else if (region == '경북') {
      return gyeongbuk;
    } else if (region == '세종') {
      return sejong;
    } else if (region == '광주') {
      return gwangju;
    } else if (region == '전북') {
      return jeonbuk;
    } else if (region == '강원') {
      return gangwon;
    } else if (region == '울산') {
      return ulsan;
    } else if (region == '전남') {
      return jeonnam;
    } else if (region == '부산') {
      return busan;
    } else if (region == '제주') {
      return jeju;
    } else {
      throw Exception('알 수 없는 지역입니다');
    }
  }
}
