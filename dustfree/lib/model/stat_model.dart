// 모델링 할 때는 무조건 class를 사용함 = key 값들을 가져옴
import 'dart:convert';

enum ItemCode {
  PM10, // 미세먼지
  PM25, // 초미세먼지
  NO2, // 이산화질소
  O3, // 오존
  CO, // 일산화탄소
  SO2, // 아황산가스
}

class StatModel {
  final double daegu;
  final double chungnam;
  final double incheon;
  final double daejeon;
  final double gyeongbuk;
  final double gangwon;
  final double sejong;
  final double gwangju;
  final double jeonbuk;
  final double ulsan;
  final double jeonnam;
  final double seoul;
  final double busan;
  final double jeju;
  final double chungbuk;
  final double gyeongnam;
  final double gyeonggi;
  final DateTime dataTime;
  final ItemCode itemCode; // enum

// 컨스트럭트가 아니라 Json 형태에서부터 데이터를 받아오기 위해 작성 = 일종의 컨벤션
  StatModel.fromJson({required Map<String, dynamic> json})
      :
        // 아래 값들은 기본적으로 Json에서 String 형태로 들어오게 되어있음 -> 이 String 값을 읽어들이고 double로 형변환을 하겠다는 의미
        daegu = double.parse(json["daegu"]),
        chungnam = double.parse(json["chungnam"]),
        incheon = double.parse(json["incheon"]),
        daejeon = double.parse(json["daejeon"]),
        gyeongbuk = double.parse(json["gyeongbuk"]),
        sejong = double.parse(json["sejong"]),
        gwangju = double.parse(json["gwangju"]),
        jeonbuk = double.parse(json["jeonbuk"]),
        gangwon = double.parse(json["gangwon"]),
        ulsan = double.parse(json["ulsan"]),
        jeonnam = double.parse(json["jeonnam"]),
        seoul = double.parse(json["seoul"]),
        busan = double.parse(json["busan"]),
        jeju = double.parse(json["jeju"]),
        chungbuk = double.parse(json["chungbuk"]),
        gyeongnam = double.parse(json["gyeongnam"]),
        gyeonggi = double.parse(json["gyeonggi"]),
        dataTime = DateTime.parse(json["dataTime"]),
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
}
