import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/data/model/user_model.dart';
import 'package:whoever/app/core/provider/users_provider.dart';
import 'package:whoever/app/data/service/pref_service.dart';
import 'package:whoever/app/data/service/user_service.dart';

class UserController extends GetxController with StateMixin<List<UserModel>> {
  final service = Get.find<UserService>();

  @override
  void onInit() {
    super.onInit();
    // fetchUsers();
  }

  fetchUsers() async {
    // [기본 상태]
    change([], status: RxStatus.loading());
    try {
      var res = await UsersProvider().getUserList();
      if (res.d != null) {
        change(res.d, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } on Exception catch (err) {
      change([], status: RxStatus.error(err.toString()));
    }
  }

  // -------------------- Validator --------------------------------

  String? emailValidator(String value) {
    if (value.isEmpty || !value.isEmail) {
      return '형식에 맞게 이메일을 작성해 주세요';
    }
    return null;
  }

  String? passWwordValidator(String value) {
    if (value.isEmpty || value.length < 4) {
      return '비밀번호는 4자리 이상으로 입력해 주세요';
    }
    return null;
  }

// --------------------------- Method --------------------------

  void formSubmit() {
    final isValid = service.loginFormKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid) {
      PrefManager.setData('loginValid', isValid);
      service.loginFormKey.currentState!.save();
      service.setLogin();

      Get.offAndToNamed(Routes.HOME);
    }
  }
}
