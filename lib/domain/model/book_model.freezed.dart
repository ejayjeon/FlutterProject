// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return _BookModel.fromJson(json);
}

/// @nodoc
mixin _$BookModel {
  int? get index => throw _privateConstructorUsedError; // 책 분류 인덱싱
  String get uuid => throw _privateConstructorUsedError; // 책 고유 UUID
  String get title => throw _privateConstructorUsedError; // 책제목
  String? get description => throw _privateConstructorUsedError; // 간략한 소개글
  List<String>? get tags => throw _privateConstructorUsedError; // [ 태그들 ]
  String? get imgPath => throw _privateConstructorUsedError; // 책표지 이미지
  List<String>? get writers =>
      throw _privateConstructorUsedError; // [ 작가 ] // UserModel로 대체
  bool get isPublic => throw _privateConstructorUsedError; // 기본값 false
  List<EpisodeModel>? get episodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookModelCopyWith<BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) then) =
      _$BookModelCopyWithImpl<$Res, BookModel>;
  @useResult
  $Res call(
      {int? index,
      String uuid,
      String title,
      String? description,
      List<String>? tags,
      String? imgPath,
      List<String>? writers,
      bool isPublic,
      List<EpisodeModel>? episodes});
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res, $Val extends BookModel>
    implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? uuid = null,
    Object? title = null,
    Object? description = freezed,
    Object? tags = freezed,
    Object? imgPath = freezed,
    Object? writers = freezed,
    Object? isPublic = null,
    Object? episodes = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imgPath: freezed == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      writers: freezed == writers
          ? _value.writers
          : writers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      episodes: freezed == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookModelCopyWith<$Res> implements $BookModelCopyWith<$Res> {
  factory _$$_BookModelCopyWith(
          _$_BookModel value, $Res Function(_$_BookModel) then) =
      __$$_BookModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String uuid,
      String title,
      String? description,
      List<String>? tags,
      String? imgPath,
      List<String>? writers,
      bool isPublic,
      List<EpisodeModel>? episodes});
}

/// @nodoc
class __$$_BookModelCopyWithImpl<$Res>
    extends _$BookModelCopyWithImpl<$Res, _$_BookModel>
    implements _$$_BookModelCopyWith<$Res> {
  __$$_BookModelCopyWithImpl(
      _$_BookModel _value, $Res Function(_$_BookModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? uuid = null,
    Object? title = null,
    Object? description = freezed,
    Object? tags = freezed,
    Object? imgPath = freezed,
    Object? writers = freezed,
    Object? isPublic = null,
    Object? episodes = freezed,
  }) {
    return _then(_$_BookModel(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imgPath: freezed == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String?,
      writers: freezed == writers
          ? _value._writers
          : writers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      episodes: freezed == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookModel implements _BookModel {
  _$_BookModel(
      {this.index,
      required this.uuid,
      required this.title,
      this.description,
      final List<String>? tags,
      this.imgPath,
      final List<String>? writers,
      required this.isPublic,
      final List<EpisodeModel>? episodes})
      : _tags = tags,
        _writers = writers,
        _episodes = episodes;

  factory _$_BookModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookModelFromJson(json);

  @override
  final int? index;
// 책 분류 인덱싱
  @override
  final String uuid;
// 책 고유 UUID
  @override
  final String title;
// 책제목
  @override
  final String? description;
// 간략한 소개글
  final List<String>? _tags;
// 간략한 소개글
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// [ 태그들 ]
  @override
  final String? imgPath;
// 책표지 이미지
  final List<String>? _writers;
// 책표지 이미지
  @override
  List<String>? get writers {
    final value = _writers;
    if (value == null) return null;
    if (_writers is EqualUnmodifiableListView) return _writers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// [ 작가 ] // UserModel로 대체
  @override
  final bool isPublic;
// 기본값 false
  final List<EpisodeModel>? _episodes;
// 기본값 false
  @override
  List<EpisodeModel>? get episodes {
    final value = _episodes;
    if (value == null) return null;
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookModel(index: $index, uuid: $uuid, title: $title, description: $description, tags: $tags, imgPath: $imgPath, writers: $writers, isPublic: $isPublic, episodes: $episodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookModel &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            const DeepCollectionEquality().equals(other._writers, _writers) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      uuid,
      title,
      description,
      const DeepCollectionEquality().hash(_tags),
      imgPath,
      const DeepCollectionEquality().hash(_writers),
      isPublic,
      const DeepCollectionEquality().hash(_episodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookModelCopyWith<_$_BookModel> get copyWith =>
      __$$_BookModelCopyWithImpl<_$_BookModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookModelToJson(
      this,
    );
  }
}

abstract class _BookModel implements BookModel {
  factory _BookModel(
      {final int? index,
      required final String uuid,
      required final String title,
      final String? description,
      final List<String>? tags,
      final String? imgPath,
      final List<String>? writers,
      required final bool isPublic,
      final List<EpisodeModel>? episodes}) = _$_BookModel;

  factory _BookModel.fromJson(Map<String, dynamic> json) =
      _$_BookModel.fromJson;

  @override
  int? get index;
  @override // 책 분류 인덱싱
  String get uuid;
  @override // 책 고유 UUID
  String get title;
  @override // 책제목
  String? get description;
  @override // 간략한 소개글
  List<String>? get tags;
  @override // [ 태그들 ]
  String? get imgPath;
  @override // 책표지 이미지
  List<String>? get writers;
  @override // [ 작가 ] // UserModel로 대체
  bool get isPublic;
  @override // 기본값 false
  List<EpisodeModel>? get episodes;
  @override
  @JsonKey(ignore: true)
  _$$_BookModelCopyWith<_$_BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}
