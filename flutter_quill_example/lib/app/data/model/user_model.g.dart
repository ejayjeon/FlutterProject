// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uuid: json['uuid'] as String,
      email: json['email'] as String,
      nickName: json['nickName'] as String?,
      profileImage: json['profileImage'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isActivated: json['isActivated'] as bool,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'email': instance.email,
      'nickName': instance.nickName,
      'profileImage': instance.profileImage,
      'phone': instance.phone,
      'gender': instance.gender,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isActivated': instance.isActivated,
    };
