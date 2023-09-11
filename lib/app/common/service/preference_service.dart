import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whoever/app/common/util/util.dart';

class PrefererenceService extends GetxService {
  PrefererenceService get to => Get.find();
  late final SharedPreferences pref;
  // SharedPreferences get pref => _pref;

  Future<PrefererenceService> init() async {
    pref = await SharedPreferences.getInstance();
    return this;
  }

  setData(String key, dynamic value) {
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
    return true;
  }

  Future<dynamic>? getData(String key) {
    dynamic obj;
    if (!pref.isBlank!) {
      obj = pref.get(key);
      return obj;
    }
    return null;
  }
}
