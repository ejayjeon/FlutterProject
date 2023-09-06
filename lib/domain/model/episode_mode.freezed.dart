// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) {
  return _EpisodeModel.fromJson(json);
}

/// @nodoc
mixin _$EpisodeModel {
  int get index => throw _privateConstructorUsedError; // 기 승 전 결 인덱싱
  String get title => throw _privateConstructorUsedError; // 에피소드 타이틀
  List<StoryModel>? get stories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeModelCopyWith<EpisodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeModelCopyWith<$Res> {
  factory $EpisodeModelCopyWith(
          EpisodeModel value, $Res Function(EpisodeModel) then) =
      _$EpisodeModelCopyWithImpl<$Res, EpisodeModel>;
  @useResult
  $Res call({int index, String title, List<StoryModel>? stories});
}

/// @nodoc
class _$EpisodeModelCopyWithImpl<$Res, $Val extends EpisodeModel>
    implements $EpisodeModelCopyWith<$Res> {
  _$EpisodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? title = null,
    Object? stories = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      stories: freezed == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EpisodeModelCopyWith<$Res>
    implements $EpisodeModelCopyWith<$Res> {
  factory _$$_EpisodeModelCopyWith(
          _$_EpisodeModel value, $Res Function(_$_EpisodeModel) then) =
      __$$_EpisodeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String title, List<StoryModel>? stories});
}

/// @nodoc
class __$$_EpisodeModelCopyWithImpl<$Res>
    extends _$EpisodeModelCopyWithImpl<$Res, _$_EpisodeModel>
    implements _$$_EpisodeModelCopyWith<$Res> {
  __$$_EpisodeModelCopyWithImpl(
      _$_EpisodeModel _value, $Res Function(_$_EpisodeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? title = null,
    Object? stories = freezed,
  }) {
    return _then(_$_EpisodeModel(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      stories: freezed == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeModel implements _EpisodeModel {
  _$_EpisodeModel(
      {required this.index,
      required this.title,
      final List<StoryModel>? stories})
      : _stories = stories;

  factory _$_EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeModelFromJson(json);

  @override
  final int index;
// 기 승 전 결 인덱싱
  @override
  final String title;
// 에피소드 타이틀
  final List<StoryModel>? _stories;
// 에피소드 타이틀
  @override
  List<StoryModel>? get stories {
    final value = _stories;
    if (value == null) return null;
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EpisodeModel(index: $index, title: $title, stories: $stories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeModel &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, index, title, const DeepCollectionEquality().hash(_stories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeModelCopyWith<_$_EpisodeModel> get copyWith =>
      __$$_EpisodeModelCopyWithImpl<_$_EpisodeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeModelToJson(
      this,
    );
  }
}

abstract class _EpisodeModel implements EpisodeModel {
  factory _EpisodeModel(
      {required final int index,
      required final String title,
      final List<StoryModel>? stories}) = _$_EpisodeModel;

  factory _EpisodeModel.fromJson(Map<String, dynamic> json) =
      _$_EpisodeModel.fromJson;

  @override
  int get index;
  @override // 기 승 전 결 인덱싱
  String get title;
  @override // 에피소드 타이틀
  List<StoryModel>? get stories;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeModelCopyWith<_$_EpisodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
