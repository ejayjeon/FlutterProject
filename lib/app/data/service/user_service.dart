import 'package:dio/dio.dart';
import 'package:flutter_by_getx_dio/app/core/const/typedef.dart';
import 'package:flutter_by_getx_dio/app/core/util/api.dart';

class UserService {
  final Api _api = Api();

  Future<Response> getUsers() async {
    try {
      final Response response = await _api.get('/users');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUserById(int id) async {
    try {
      final Response response = await _api.get('/users/$id');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postUser({JSON? data}) async {
    try {
      final Response response = await _api.post(
        '/users',
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> pusUser(int id, {JSON? data}) async {
    try {
      final Response response = await _api.put(
        '/users/$id',
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteUser(int id) async {
    try {
      final Response response = await _api.delete(
        '/users/$id',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
