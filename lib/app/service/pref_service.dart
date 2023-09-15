import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whoever/app/core/util/utils.dart';

class PrefService extends GetxService {
  static PrefService get to => Get.find<PrefService>();
  static late final SharedPreferences _pref;
  SharedPreferences get pref => _pref;

  Future<PrefService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }
}

class PrefManager {
  static final pref = PrefService.to.pref;
  static getData(String key) async {
    dynamic obj;
    if (!pref.isBlank!) {
      obj = pref.get(key);
      return obj;
    }
    return null;
  }

  static setData(String key, dynamic value) async {
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
}
