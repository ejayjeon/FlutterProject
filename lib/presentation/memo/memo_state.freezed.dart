// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MemoStateTearOff {
  const _$MemoStateTearOff();

  _MemoState call(
      {required List<Memo> memos,
      required MemoOrder memoOrder,
      required bool isOrderSectionVisible}) {
    return _MemoState(
      memos: memos,
      memoOrder: memoOrder,
      isOrderSectionVisible: isOrderSectionVisible,
    );
  }
}

/// @nodoc
const $MemoState = _$MemoStateTearOff();

/// @nodoc
mixin _$MemoState {
  List<Memo> get memos =>
      throw _privateConstructorUsedError; // default 값으로 쓰기 위해 / required를 사용할 수 있음
  MemoOrder get memoOrder => throw _privateConstructorUsedError;
  bool get isOrderSectionVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemoStateCopyWith<MemoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoStateCopyWith<$Res> {
  factory $MemoStateCopyWith(MemoState value, $Res Function(MemoState) then) =
      _$MemoStateCopyWithImpl<$Res>;
  $Res call(
      {List<Memo> memos, MemoOrder memoOrder, bool isOrderSectionVisible});

  $MemoOrderCopyWith<$Res> get memoOrder;
}

/// @nodoc
class _$MemoStateCopyWithImpl<$Res> implements $MemoStateCopyWith<$Res> {
  _$MemoStateCopyWithImpl(this._value, this._then);

  final MemoState _value;
  // ignore: unused_field
  final $Res Function(MemoState) _then;

  @override
  $Res call({
    Object? memos = freezed,
    Object? memoOrder = freezed,
    Object? isOrderSectionVisible = freezed,
  }) {
    return _then(_value.copyWith(
      memos: memos == freezed
          ? _value.memos
          : memos // ignore: cast_nullable_to_non_nullable
              as List<Memo>,
      memoOrder: memoOrder == freezed
          ? _value.memoOrder
          : memoOrder // ignore: cast_nullable_to_non_nullable
              as MemoOrder,
      isOrderSectionVisible: isOrderSectionVisible == freezed
          ? _value.isOrderSectionVisible
          : isOrderSectionVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $MemoOrderCopyWith<$Res> get memoOrder {
    return $MemoOrderCopyWith<$Res>(_value.memoOrder, (value) {
      return _then(_value.copyWith(memoOrder: value));
    });
  }
}

/// @nodoc
abstract class _$MemoStateCopyWith<$Res> implements $MemoStateCopyWith<$Res> {
  factory _$MemoStateCopyWith(
          _MemoState value, $Res Function(_MemoState) then) =
      __$MemoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Memo> memos, MemoOrder memoOrder, bool isOrderSectionVisible});

  @override
  $MemoOrderCopyWith<$Res> get memoOrder;
}

/// @nodoc
class __$MemoStateCopyWithImpl<$Res> extends _$MemoStateCopyWithImpl<$Res>
    implements _$MemoStateCopyWith<$Res> {
  __$MemoStateCopyWithImpl(_MemoState _value, $Res Function(_MemoState) _then)
      : super(_value, (v) => _then(v as _MemoState));

  @override
  _MemoState get _value => super._value as _MemoState;

  @override
  $Res call({
    Object? memos = freezed,
    Object? memoOrder = freezed,
    Object? isOrderSectionVisible = freezed,
  }) {
    return _then(_MemoState(
      memos: memos == freezed
          ? _value.memos
          : memos // ignore: cast_nullable_to_non_nullable
              as List<Memo>,
      memoOrder: memoOrder == freezed
          ? _value.memoOrder
          : memoOrder // ignore: cast_nullable_to_non_nullable
              as MemoOrder,
      isOrderSectionVisible: isOrderSectionVisible == freezed
          ? _value.isOrderSectionVisible
          : isOrderSectionVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MemoState implements _MemoState {
  _$_MemoState(
      {required this.memos,
      required this.memoOrder,
      required this.isOrderSectionVisible});

  @override
  final List<Memo> memos;
  @override // default 값으로 쓰기 위해 / required를 사용할 수 있음
  final MemoOrder memoOrder;
  @override
  final bool isOrderSectionVisible;

  @override
  String toString() {
    return 'MemoState(memos: $memos, memoOrder: $memoOrder, isOrderSectionVisible: $isOrderSectionVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemoState &&
            const DeepCollectionEquality().equals(other.memos, memos) &&
            const DeepCollectionEquality().equals(other.memoOrder, memoOrder) &&
            const DeepCollectionEquality()
                .equals(other.isOrderSectionVisible, isOrderSectionVisible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(memos),
      const DeepCollectionEquality().hash(memoOrder),
      const DeepCollectionEquality().hash(isOrderSectionVisible));

  @JsonKey(ignore: true)
  @override
  _$MemoStateCopyWith<_MemoState> get copyWith =>
      __$MemoStateCopyWithImpl<_MemoState>(this, _$identity);
}

abstract class _MemoState implements MemoState {
  factory _MemoState(
      {required List<Memo> memos,
      required MemoOrder memoOrder,
      required bool isOrderSectionVisible}) = _$_MemoState;

  @override
  List<Memo> get memos;
  @override // default 값으로 쓰기 위해 / required를 사용할 수 있음
  MemoOrder get memoOrder;
  @override
  bool get isOrderSectionVisible;
  @override
  @JsonKey(ignore: true)
  _$MemoStateCopyWith<_MemoState> get copyWith =>
      throw _privateConstructorUsedError;
}
