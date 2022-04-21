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
  final DateTime dateTime;
  final ItemCode itemCode; // enum

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
}
