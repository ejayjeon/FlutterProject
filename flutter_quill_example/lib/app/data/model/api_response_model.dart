// [API Status Check]

import 'dart:convert';

class ApiResponse<T> {
  int c; // code: 0, 1
  String s; // status: Success or Fail
  T? d; // data : []

  ApiResponse({
    this.c = 0,
    this.s = '',
    this.d,
  });

  factory ApiResponse.fromBaseJson(Map<String, dynamic> json) => ApiResponse<T>(
        c: json['c'] ?? json['c'],
        s: json['s'] ?? json['s'],
      );

  // [String]
  factory ApiResponse.fromStringJson(
          Map<String, dynamic> json, Function(String) create) =>
      ApiResponse<T>(
        c: json['c'] ?? int.tryParse(json['c'].toString()) ?? 0,
        s: json['s'] ?? json['s'],
        d: json['d'] ?? create(json['d'].toString()),
      );

  // [Map]
  factory ApiResponse.fromMapJson(
          Map<String, dynamic> json, Function(Map<String, dynamic>) create) =>
      ApiResponse<T>(
        c: json['c'] ?? int.tryParse(json['c'].toString()) ?? 0,
        s: json['s'] ?? json['s'],
        d: json['d'] ?? create(json['d']),
      );

  // [List]
  factory ApiResponse.fromListJson(
          Map<String, dynamic> json, Function(List<dynamic>) create) =>
      ApiResponse<T>(
        c: json['c'] ?? int.tryParse(json['c'].toString()) ?? 0,
        s: json['s'] ?? json['s'],
        d: json['d'] ?? create(json['d']),
      );

  // [Err]
  factory ApiResponse.fromError({String errorMessage = 'Error'}) =>
      ApiResponse<T>(
        c: 0,
        s: errorMessage,
      );

  //ToJson
  Map<String, dynamic> toJson<ApiResponse>() => {
        'c': c,
        's': s,
        'd': d,
      };

  String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());
}
