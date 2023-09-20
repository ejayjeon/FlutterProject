import 'package:get/get.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/user_service.dart';

class UserController extends GetxController {
  final user = Get.find<UserService>();
  @override
  void onInit() {
    super.onInit();
    Log('... user Controller init');
  }
}
