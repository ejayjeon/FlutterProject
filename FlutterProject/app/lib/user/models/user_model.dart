import 'package:app/common/utils/ip.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

abstract class UserModelBase {}

class UserModelError extends UserModelBase {
  final String message;

  UserModelError({
    required this.message,
  });
}

class UserModelLoading extends UserModelBase {}

@JsonSerializable()
class UserModel extends UserModelBase {
  final String userId;
  final String userPwd;
  @JsonKey(
    fromJson: IP.pathToUrl,
  )
  final String imageUrl;

  UserModel({
    required this.userId,
    required this.userPwd,
    required this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
