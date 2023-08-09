import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String refreshToken;
  final String accressToken;

  LoginModel({
    required this.refreshToken,
    required this.accressToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable()
class TokenModel {
  final String accessToken;

  TokenModel({
    required this.accessToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
