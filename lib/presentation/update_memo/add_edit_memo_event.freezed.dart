// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_edit_memo_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddEditMemoEventTearOff {
  const _$AddEditMemoEventTearOff();

  ChangeColor changeColor(int color) {
    return ChangeColor(
      color,
    );
  }

  SaveMemo saveMemo(int? id, String title, String content) {
    return SaveMemo(
      id,
      title,
      content,
    );
  }
}

/// @nodoc
const $AddEditMemoEvent = _$AddEditMemoEventTearOff();

/// @nodoc
mixin _$AddEditMemoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int color) changeColor,
    required TResult Function(int? id, String title, String content) saveMemo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveMemo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveMemo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SaveMemo value) saveMemo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveMemo value)? saveMemo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveMemo value)? saveMemo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditMemoEventCopyWith<$Res> {
  factory $AddEditMemoEventCopyWith(
          AddEditMemoEvent value, $Res Function(AddEditMemoEvent) then) =
      _$AddEditMemoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddEditMemoEventCopyWithImpl<$Res>
    implements $AddEditMemoEventCopyWith<$Res> {
  _$AddEditMemoEventCopyWithImpl(this._value, this._then);

  final AddEditMemoEvent _value;
  // ignore: unused_field
  final $Res Function(AddEditMemoEvent) _then;
}

/// @nodoc
abstract class $ChangeColorCopyWith<$Res> {
  factory $ChangeColorCopyWith(
          ChangeColor value, $Res Function(ChangeColor) then) =
      _$ChangeColorCopyWithImpl<$Res>;
  $Res call({int color});
}

/// @nodoc
class _$ChangeColorCopyWithImpl<$Res>
    extends _$AddEditMemoEventCopyWithImpl<$Res>
    implements $ChangeColorCopyWith<$Res> {
  _$ChangeColorCopyWithImpl(
      ChangeColor _value, $Res Function(ChangeColor) _then)
      : super(_value, (v) => _then(v as ChangeColor));

  @override
  ChangeColor get _value => super._value as ChangeColor;

  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(ChangeColor(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeColor implements ChangeColor {
  const _$ChangeColor(this.color);

  @override
  final int color;

  @override
  String toString() {
    return 'AddEditMemoEvent.changeColor(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeColor &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  $ChangeColorCopyWith<ChangeColor> get copyWith =>
      _$ChangeColorCopyWithImpl<ChangeColor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int color) changeColor,
    required TResult Function(int? id, String title, String content) saveMemo,
  }) {
    return changeColor(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveMemo,
  }) {
    return changeColor?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveMemo,
    required TResult orElse(),
  }) {
    if (changeColor != null) {
      return changeColor(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SaveMemo value) saveMemo,
  }) {
    return changeColor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveMemo value)? saveMemo,
  }) {
    return changeColor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveMemo value)? saveMemo,
    required TResult orElse(),
  }) {
    if (changeColor != null) {
      return changeColor(this);
    }
    return orElse();
  }
}

abstract class ChangeColor implements AddEditMemoEvent {
  const factory ChangeColor(int color) = _$ChangeColor;

  int get color;
  @JsonKey(ignore: true)
  $ChangeColorCopyWith<ChangeColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveMemoCopyWith<$Res> {
  factory $SaveMemoCopyWith(SaveMemo value, $Res Function(SaveMemo) then) =
      _$SaveMemoCopyWithImpl<$Res>;
  $Res call({int? id, String title, String content});
}

/// @nodoc
class _$SaveMemoCopyWithImpl<$Res> extends _$AddEditMemoEventCopyWithImpl<$Res>
    implements $SaveMemoCopyWith<$Res> {
  _$SaveMemoCopyWithImpl(SaveMemo _value, $Res Function(SaveMemo) _then)
      : super(_value, (v) => _then(v as SaveMemo));

  @override
  SaveMemo get _value => super._value as SaveMemo;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(SaveMemo(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveMemo implements SaveMemo {
  const _$SaveMemo(this.id, this.title, this.content);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'AddEditMemoEvent.saveMemo(id: $id, title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveMemo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  $SaveMemoCopyWith<SaveMemo> get copyWith =>
      _$SaveMemoCopyWithImpl<SaveMemo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int color) changeColor,
    required TResult Function(int? id, String title, String content) saveMemo,
  }) {
    return saveMemo(id, title, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveMemo,
  }) {
    return saveMemo?.call(id, title, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int color)? changeColor,
    TResult Function(int? id, String title, String content)? saveMemo,
    required TResult orElse(),
  }) {
    if (saveMemo != null) {
      return saveMemo(id, title, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SaveMemo value) saveMemo,
  }) {
    return saveMemo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveMemo value)? saveMemo,
  }) {
    return saveMemo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveMemo value)? saveMemo,
    required TResult orElse(),
  }) {
    if (saveMemo != null) {
      return saveMemo(this);
    }
    return orElse();
  }
}

abstract class SaveMemo implements AddEditMemoEvent {
  const factory SaveMemo(int? id, String title, String content) = _$SaveMemo;

  int? get id;
  String get title;
  String get content;
  @JsonKey(ignore: true)
  $SaveMemoCopyWith<SaveMemo> get copyWith =>
      throw _privateConstructorUsedError;
}
