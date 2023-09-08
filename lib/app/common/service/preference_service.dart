import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefererenceService extends GetxService {
  late final SharedPreferences _pref;
  SharedPreferences get pref => _pref;

  Future<PrefererenceService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }
}
