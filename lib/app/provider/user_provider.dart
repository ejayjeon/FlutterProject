import 'package:get/get.dart';
import 'package:whoever/app/model/user_model.dart';
import 'package:whoever/app/service/user_service.dart';

class UserProvider extends GetConnect implements GetxService {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (json) => UserModel.fromJson(json);
    httpClient.baseUrl = 'http://localhost:8000';
  }

  Future<Response> getUserByUuid(String uuid) =>
      get('${httpClient.baseUrl}/$uuid');
}
