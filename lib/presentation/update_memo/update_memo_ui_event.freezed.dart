// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_memo_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpdateMemoUiEventTearOff {
  const _$UpdateMemoUiEventTearOff();

  SaveMemo saveMemo() {
    return const SaveMemo();
  }

  ShowSnackBar showSnackBar(String message) {
    return ShowSnackBar(
      message,
    );
  }
}

/// @nodoc
const $UpdateMemoUiEvent = _$UpdateMemoUiEventTearOff();

/// @nodoc
mixin _$UpdateMemoUiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveMemo,
    required TResult Function(String message) showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? saveMemo,
    TResult Function(String message)? showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveMemo,
    TResult Function(String message)? showSnackBar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveMemo value) saveMemo,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SaveMemo value)? saveMemo,
    TResult Function(ShowSnackBar value)? showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveMemo value)? saveMemo,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMemoUiEventCopyWith<$Res> {
  factory $UpdateMemoUiEventCopyWith(
          UpdateMemoUiEvent value, $Res Function(UpdateMemoUiEvent) then) =
      _$UpdateMemoUiEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UpdateMemoUiEventCopyWithImpl<$Res>
    implements $UpdateMemoUiEventCopyWith<$Res> {
  _$UpdateMemoUiEventCopyWithImpl(this._value, this._then);

  final UpdateMemoUiEvent _value;
  // ignore: unused_field
  final $Res Function(UpdateMemoUiEvent) _then;
}

/// @nodoc
abstract class $SaveMemoCopyWith<$Res> {
  factory $SaveMemoCopyWith(SaveMemo value, $Res Function(SaveMemo) then) =
      _$SaveMemoCopyWithImpl<$Res>;
}

/// @nodoc
class _$SaveMemoCopyWithImpl<$Res> extends _$UpdateMemoUiEventCopyWithImpl<$Res>
    implements $SaveMemoCopyWith<$Res> {
  _$SaveMemoCopyWithImpl(SaveMemo _value, $Res Function(SaveMemo) _then)
      : super(_value, (v) => _then(v as SaveMemo));

  @override
  SaveMemo get _value => super._value as SaveMemo;
}

/// @nodoc

class _$SaveMemo implements SaveMemo {
  const _$SaveMemo();

  @override
  String toString() {
    return 'UpdateMemoUiEvent.saveMemo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SaveMemo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveMemo,
    required TResult Function(String message) showSnackBar,
  }) {
    return saveMemo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? saveMemo,
    TResult Function(String message)? showSnackBar,
  }) {
    return saveMemo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveMemo,
    TResult Function(String message)? showSnackBar,
    required TResult orElse(),
  }) {
    if (saveMemo != null) {
      return saveMemo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveMemo value) saveMemo,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) {
    return saveMemo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SaveMemo value)? saveMemo,
    TResult Function(ShowSnackBar value)? showSnackBar,
  }) {
    return saveMemo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveMemo value)? saveMemo,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) {
    if (saveMemo != null) {
      return saveMemo(this);
    }
    return orElse();
  }
}

abstract class SaveMemo implements UpdateMemoUiEvent {
  const factory SaveMemo() = _$SaveMemo;
}

/// @nodoc
abstract class $ShowSnackBarCopyWith<$Res> {
  factory $ShowSnackBarCopyWith(
          ShowSnackBar value, $Res Function(ShowSnackBar) then) =
      _$ShowSnackBarCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ShowSnackBarCopyWithImpl<$Res>
    extends _$UpdateMemoUiEventCopyWithImpl<$Res>
    implements $ShowSnackBarCopyWith<$Res> {
  _$ShowSnackBarCopyWithImpl(
      ShowSnackBar _value, $Res Function(ShowSnackBar) _then)
      : super(_value, (v) => _then(v as ShowSnackBar));

  @override
  ShowSnackBar get _value => super._value as ShowSnackBar;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ShowSnackBar(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowSnackBar implements ShowSnackBar {
  const _$ShowSnackBar(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UpdateMemoUiEvent.showSnackBar(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowSnackBar &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ShowSnackBarCopyWith<ShowSnackBar> get copyWith =>
      _$ShowSnackBarCopyWithImpl<ShowSnackBar>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveMemo,
    required TResult Function(String message) showSnackBar,
  }) {
    return showSnackBar(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? saveMemo,
    TResult Function(String message)? showSnackBar,
  }) {
    return showSnackBar?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveMemo,
    TResult Function(String message)? showSnackBar,
    required TResult orElse(),
  }) {
    if (showSnackBar != null) {
      return showSnackBar(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveMemo value) saveMemo,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) {
    return showSnackBar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SaveMemo value)? saveMemo,
    TResult Function(ShowSnackBar value)? showSnackBar,
  }) {
    return showSnackBar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveMemo value)? saveMemo,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) {
    if (showSnackBar != null) {
      return showSnackBar(this);
    }
    return orElse();
  }
}

abstract class ShowSnackBar implements UpdateMemoUiEvent {
  const factory ShowSnackBar(String message) = _$ShowSnackBar;

  String get message;
  @JsonKey(ignore: true)
  $ShowSnackBarCopyWith<ShowSnackBar> get copyWith =>
      throw _privateConstructorUsedError;
}
