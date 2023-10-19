import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String uuid, // 식별 아이디 (자동 등록)
    required String email, // 유저 이메일 (직접 등록)
    String? nickName, // 유저 닉네임 (직접 등록)
    String? profileImage, // 프로필 이미지
    String? phone, // 유저 폰넘버 (직접 등록)
    int? gender, // 성별 0: 남자, 1: 여자, 2: 비공개
    required DateTime createdAt, // 프로필 생성 일자 (기본 DateTime.now())
    DateTime? updatedAt, // 프로필 업데이트 일자
    required bool isActivated, // 프로필 활성화 여부
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
