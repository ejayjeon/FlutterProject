// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Memo _$MemoFromJson(Map<String, dynamic> json) {
  return _Memo.fromJson(json);
}

/// @nodoc
class _$MemoTearOff {
  const _$MemoTearOff();

  _Memo call(
      {required String title,
      required String content,
      required int color,
      required int timestamp,
      int? id}) {
    return _Memo(
      title: title,
      content: content,
      color: color,
      timestamp: timestamp,
      id: id,
    );
  }

  Memo fromJson(Map<String, Object?> json) {
    return Memo.fromJson(json);
  }
}

/// @nodoc
const $Memo = _$MemoTearOff();

/// @nodoc
mixin _$Memo {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res>;
  $Res call({String title, String content, int color, int timestamp, int? id});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res> implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  final Memo _value;
  // ignore: unused_field
  final $Res Function(Memo) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? color = freezed,
    Object? timestamp = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MemoCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$MemoCopyWith(_Memo value, $Res Function(_Memo) then) =
      __$MemoCopyWithImpl<$Res>;
  @override
  $Res call({String title, String content, int color, int timestamp, int? id});
}

/// @nodoc
class __$MemoCopyWithImpl<$Res> extends _$MemoCopyWithImpl<$Res>
    implements _$MemoCopyWith<$Res> {
  __$MemoCopyWithImpl(_Memo _value, $Res Function(_Memo) _then)
      : super(_value, (v) => _then(v as _Memo));

  @override
  _Memo get _value => super._value as _Memo;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? color = freezed,
    Object? timestamp = freezed,
    Object? id = freezed,
  }) {
    return _then(_Memo(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Memo implements _Memo {
  _$_Memo(
      {required this.title,
      required this.content,
      required this.color,
      required this.timestamp,
      this.id});

  factory _$_Memo.fromJson(Map<String, dynamic> json) => _$$_MemoFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final int color;
  @override
  final int timestamp;
  @override
  final int? id;

  @override
  String toString() {
    return 'Memo(title: $title, content: $content, color: $color, timestamp: $timestamp, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Memo &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$MemoCopyWith<_Memo> get copyWith =>
      __$MemoCopyWithImpl<_Memo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemoToJson(this);
  }
}

abstract class _Memo implements Memo {
  factory _Memo(
      {required String title,
      required String content,
      required int color,
      required int timestamp,
      int? id}) = _$_Memo;

  factory _Memo.fromJson(Map<String, dynamic> json) = _$_Memo.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  int get color;
  @override
  int get timestamp;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$MemoCopyWith<_Memo> get copyWith => throw _privateConstructorUsedError;
}
