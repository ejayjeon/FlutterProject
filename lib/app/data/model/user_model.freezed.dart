// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uuid => throw _privateConstructorUsedError; // 식별 아이디 (자동 등록)
  String get email => throw _privateConstructorUsedError; // 유저 이메일 (직접 등록)
  String? get nickName => throw _privateConstructorUsedError; // 유저 닉네임 (직접 등록)
  String? get profileImage => throw _privateConstructorUsedError; // 프로필 이미지
  String? get phone => throw _privateConstructorUsedError; // 유저 폰넘버 (직접 등록)
  int? get gender =>
      throw _privateConstructorUsedError; // 성별 0: 남자, 1: 여자, 2: 비공개
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // 프로필 생성 일자 (기본 DateTime.now())
  DateTime? get updatedAt => throw _privateConstructorUsedError; // 프로필 업데이트 일자
  bool get isActivated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uuid,
      String email,
      String? nickName,
      String? profileImage,
      String? phone,
      int? gender,
      DateTime createdAt,
      DateTime? updatedAt,
      bool isActivated});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? email = null,
    Object? nickName = freezed,
    Object? profileImage = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isActivated = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActivated: null == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String email,
      String? nickName,
      String? profileImage,
      String? phone,
      int? gender,
      DateTime createdAt,
      DateTime? updatedAt,
      bool isActivated});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? email = null,
    Object? nickName = freezed,
    Object? profileImage = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? isActivated = null,
  }) {
    return _then(_$_UserModel(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActivated: null == isActivated
          ? _value.isActivated
          : isActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {required this.uuid,
      required this.email,
      this.nickName,
      this.profileImage,
      this.phone,
      this.gender,
      required this.createdAt,
      this.updatedAt,
      required this.isActivated});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String uuid;
// 식별 아이디 (자동 등록)
  @override
  final String email;
// 유저 이메일 (직접 등록)
  @override
  final String? nickName;
// 유저 닉네임 (직접 등록)
  @override
  final String? profileImage;
// 프로필 이미지
  @override
  final String? phone;
// 유저 폰넘버 (직접 등록)
  @override
  final int? gender;
// 성별 0: 남자, 1: 여자, 2: 비공개
  @override
  final DateTime createdAt;
// 프로필 생성 일자 (기본 DateTime.now())
  @override
  final DateTime? updatedAt;
// 프로필 업데이트 일자
  @override
  final bool isActivated;

  @override
  String toString() {
    return 'UserModel(uuid: $uuid, email: $email, nickName: $nickName, profileImage: $profileImage, phone: $phone, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt, isActivated: $isActivated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActivated, isActivated) ||
                other.isActivated == isActivated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, email, nickName,
      profileImage, phone, gender, createdAt, updatedAt, isActivated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String uuid,
      required final String email,
      final String? nickName,
      final String? profileImage,
      final String? phone,
      final int? gender,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      required final bool isActivated}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get uuid;
  @override // 식별 아이디 (자동 등록)
  String get email;
  @override // 유저 이메일 (직접 등록)
  String? get nickName;
  @override // 유저 닉네임 (직접 등록)
  String? get profileImage;
  @override // 프로필 이미지
  String? get phone;
  @override // 유저 폰넘버 (직접 등록)
  int? get gender;
  @override // 성별 0: 남자, 1: 여자, 2: 비공개
  DateTime get createdAt;
  @override // 프로필 생성 일자 (기본 DateTime.now())
  DateTime? get updatedAt;
  @override // 프로필 업데이트 일자
  bool get isActivated;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
