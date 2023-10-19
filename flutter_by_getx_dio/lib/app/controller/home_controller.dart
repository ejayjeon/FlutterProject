import 'package:dio/dio.dart';
import 'package:flutter_by_getx_dio/app/core/const/typedef.dart';
import 'package:flutter_by_getx_dio/app/data/model/user.dart';
import 'package:flutter_by_getx_dio/app/data/service/user_service.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController with StateMixin<List<Users>> {
  final UserService _userService = UserService();
  RxList<Users> users = <Users>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    try {
      change([], status: RxStatus.loading());
      final response = await _userService.getUsers();
      if (response.statusCode == 200) {
        final userModel = UserModel.fromJson(response.data);
        if (userModel.users != null) {
          users.assignAll(userModel.users!);
          change(users, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error('No User Data'));
      }
    } on DioException catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  // [AddUser /POST]
  void addUser({JSON? data}) async {
    try {
      final response = await _userService.postUser(
        data: data,
      );
      if (response.statusCode == 200) {
        fetchUser();
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  // [Update /PUT]
  void updateUser(int id, {JSON? data}) async {
    try {
      final response = await _userService.pusUser(
        id,
        data: data,
      );
      if (response.statusCode == 200) {
        fetchUser();
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  // [Delete /DELETE]
  void deleteUser(int id) async {
    try {
      print('>>>> $id');
      final response = await _userService.deleteUser(id);

      if (response.statusCode == 200) {
        users.removeWhere((e) => e.id == id);
        fetchUser();
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
