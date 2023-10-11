import 'package:get/get.dart';
import 'package:whoever/app/presentation/controller/pin_controller.dart';

class PinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PinController());
  }
}
