import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whoever/app/common/util/util.dart';

// class PrefererenceService extends GetxService {
//   PrefererenceService get to => Get.find();
//   late final SharedPreferences _pref;
//   SharedPreferences get pref => _pref;

//   Future<SharedPreferences> init() async {
//     _pref = await SharedPreferences.getInstance();
//     return _pref;
//   }
// }

class StorageManager {
  static setData(String key, dynamic value) async {
    final pref = await SharedPreferences.getInstance();
    if (value is int) {
      pref.setInt(key, value);
    } else if (value is String) {
      pref.setString(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else if (value is List<String>) {
      pref.setStringList(key, value);
    } else {
      return false;
    }
  }

  static getData(String key) async {
    final pref = await SharedPreferences.getInstance();
    dynamic obj;
    if (!pref.isBlank!) {
      obj = pref.get(key);
      return obj;
    }
    return null;
  }
}
