// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return _StoryModel.fromJson(json);
}

/// @nodoc
mixin _$StoryModel {
  int? get index => throw _privateConstructorUsedError; // auto-increment
  String get version => throw _privateConstructorUsedError; // ex 1.3.14 ...
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String>? get writer => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryModelCopyWith<StoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryModelCopyWith<$Res> {
  factory $StoryModelCopyWith(
          StoryModel value, $Res Function(StoryModel) then) =
      _$StoryModelCopyWithImpl<$Res, StoryModel>;
  @useResult
  $Res call(
      {int? index,
      String version,
      String title,
      String content,
      DateTime createdAt,
      DateTime? updatedAt,
      List<String>? writer,
      bool isPrivate});
}

/// @nodoc
class _$StoryModelCopyWithImpl<$Res, $Val extends StoryModel>
    implements $StoryModelCopyWith<$Res> {
  _$StoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? version = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? writer = freezed,
    Object? isPrivate = null,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      writer: freezed == writer
          ? _value.writer
          : writer // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryModelCopyWith<$Res>
    implements $StoryModelCopyWith<$Res> {
  factory _$$_StoryModelCopyWith(
          _$_StoryModel value, $Res Function(_$_StoryModel) then) =
      __$$_StoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String version,
      String title,
      String content,
      DateTime createdAt,
      DateTime? updatedAt,
      List<String>? writer,
      bool isPrivate});
}

/// @nodoc
class __$$_StoryModelCopyWithImpl<$Res>
    extends _$StoryModelCopyWithImpl<$Res, _$_StoryModel>
    implements _$$_StoryModelCopyWith<$Res> {
  __$$_StoryModelCopyWithImpl(
      _$_StoryModel _value, $Res Function(_$_StoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? version = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? writer = freezed,
    Object? isPrivate = null,
  }) {
    return _then(_$_StoryModel(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      writer: freezed == writer
          ? _value._writer
          : writer // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoryModel implements _StoryModel {
  _$_StoryModel(
      {this.index,
      required this.version,
      required this.title,
      required this.content,
      required this.createdAt,
      this.updatedAt,
      final List<String>? writer,
      required this.isPrivate})
      : _writer = writer;

  factory _$_StoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoryModelFromJson(json);

  @override
  final int? index;
// auto-increment
  @override
  final String version;
// ex 1.3.14 ...
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  final List<String>? _writer;
  @override
  List<String>? get writer {
    final value = _writer;
    if (value == null) return null;
    if (_writer is EqualUnmodifiableListView) return _writer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isPrivate;

  @override
  String toString() {
    return 'StoryModel(index: $index, version: $version, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, writer: $writer, isPrivate: $isPrivate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryModel &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._writer, _writer) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      version,
      title,
      content,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_writer),
      isPrivate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryModelCopyWith<_$_StoryModel> get copyWith =>
      __$$_StoryModelCopyWithImpl<_$_StoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryModelToJson(
      this,
    );
  }
}

abstract class _StoryModel implements StoryModel {
  factory _StoryModel(
      {final int? index,
      required final String version,
      required final String title,
      required final String content,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final List<String>? writer,
      required final bool isPrivate}) = _$_StoryModel;

  factory _StoryModel.fromJson(Map<String, dynamic> json) =
      _$_StoryModel.fromJson;

  @override
  int? get index;
  @override // auto-increment
  String get version;
  @override // ex 1.3.14 ...
  String get title;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<String>? get writer;
  @override
  bool get isPrivate;
  @override
  @JsonKey(ignore: true)
  _$$_StoryModelCopyWith<_$_StoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
