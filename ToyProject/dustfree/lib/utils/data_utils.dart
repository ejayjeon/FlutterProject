import 'package:dustfree/const/status_level.dart';
import 'package:dustfree/model/stat_model.dart';
import 'package:dustfree/model/status_model.dart';

class DataUtils {
// AppBar : 타임 포맷
  static String getTimeFromDateTime({required DateTime dateTime}) {
    return '${dateTime.year}-${getTimeFormat(dateTime.month)}-${getTimeFormat(dateTime.day)} ${getTimeFormat(dateTime.hour)} : ${getTimeFormat(dateTime.minute)}';
  }

  static String getTimeFormat(int num) {
    return num.toString().padLeft(2, '0');
  }

// ItemCode 별 단위 포맷
  static String getUnitFromItemCode({
    required ItemCode itemcode,
  }) {
    switch (itemcode) {
      case ItemCode.PM10:
        return '㎍/m';
      case ItemCode.PM25:
        return '㎍/m';
      default:
        return 'ppm';
    }
  }

  static String itemCodeKrString({
    required ItemCode itemCode,
  }) {
    switch (itemCode) {
      case ItemCode.PM10:
        return '미세먼지';
      case ItemCode.PM25:
        return '초미세먼지';
      case ItemCode.NO2:
        return '이산화질소';
      case ItemCode.CO:
        return '일산화탄소';
      case ItemCode.O3:
        return '오존';
      case ItemCode.SO2:
        return '아황산가스';
      default:
        return '데이터가 없습니다';
    }
  }

  static StatusModel getStatusFromItemCodeFromValue({
    required double value,
    required ItemCode itemCode,
  }) {
    // => status.minFineDust < value,
    // 현재는 minFineDust로만 비교함. 이걸 모든 아이템을 다 비교하는 로직이 필요함
    return statusLevel.where(
      (status) {
        if (itemCode == ItemCode.PM10) {
          return status.minFineDust < value;
        } else if (itemCode == ItemCode.PM25) {
          return status.minUltraFineDust < value;
        } else if (itemCode == ItemCode.CO) {
          return status.minCO < value;
        } else if (itemCode == ItemCode.NO2) {
          return status.minNO2 < value;
        } else if (itemCode == ItemCode.O3) {
          return status.minO3 < value;
        } else if (itemCode == ItemCode.SO2) {
          return status.minSO2 < value;
        } else {
          throw Exception('알 수 없는 대기 상태입니다');
        }
      },
    ).last;
  }
}
