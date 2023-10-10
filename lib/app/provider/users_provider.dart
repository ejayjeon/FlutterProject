import 'package:whoever/app/core/util/api.dart';
import 'package:whoever/app/model/api_response_model.dart';
import 'package:whoever/app/model/user_model.dart';

class UsersProvider {
  Future<ApiResponse<List<UserModel>>> getUserList() async {
    try {
      var api = await Api().get('http://localhost:8080/');
      var res = ApiResponse<List<UserModel>>.fromListJson(
        api.data,
        (p) => p.map((e) => UserModel.fromJson(e)).toList(),
      );
      return res;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
