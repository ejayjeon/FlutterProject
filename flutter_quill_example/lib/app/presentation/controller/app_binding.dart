import 'package:get/get.dart';
import 'package:whoever/app/presentation/controller/app_controller.dart';
import 'package:whoever/app/presentation/controller/asset_controller.dart';
import 'package:whoever/app/presentation/controller/edit_controller.dart';
import 'package:whoever/app/presentation/controller/pin_controller.dart';
import 'package:whoever/app/presentation/controller/user_controller.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/data/service/pref_service.dart';
import 'package:whoever/app/data/service/user_service.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    // await Get.putAsync(() => PrefService().init());
    // await Get.putAsync(() => UserService().init());
    Get.put(AppController());
    // Get.put(PinController());
    Get.put(UserController());
    Get.put(AssetController());
    Get.put(EditController());
    // Get.lazyPut(() => PinController());
  }
}
