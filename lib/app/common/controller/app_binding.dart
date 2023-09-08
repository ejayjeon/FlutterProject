import 'package:get/get.dart';
import 'package:whoever/app/common/controller/app_controller.dart';
import 'package:whoever/app/common/service/preference_service.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/home/controller/home_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    await Get.putAsync<PrefererenceService>(() => PrefererenceService().init());
    Get.put(AppController());
    Get.put(HomeController());
    return;
  }
}
