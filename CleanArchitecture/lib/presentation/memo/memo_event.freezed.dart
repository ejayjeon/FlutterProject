// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memo_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MemoEventTearOff {
  const _$MemoEventTearOff();

  LoadMemos loadMemos() {
    return const LoadMemos();
  }

  DeleteMemo deleteMemo(Memo memo) {
    return DeleteMemo(
      memo,
    );
  }

  UndoMemo undoMemo() {
    return const UndoMemo();
  }

  ChangeOrder changeOrder(MemoOrder memoOrder) {
    return ChangeOrder(
      memoOrder,
    );
  }

  ToggleOrderSection toggleOrderSection() {
    return const ToggleOrderSection();
  }
}

/// @nodoc
const $MemoEvent = _$MemoEventTearOff();

/// @nodoc
mixin _$MemoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMemos,
    required TResult Function(Memo memo) deleteMemo,
    required TResult Function() undoMemo,
    required TResult Function(MemoOrder memoOrder) changeOrder,
    required TResult Function() toggleOrderSection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMemos value) loadMemos,
    required TResult Function(DeleteMemo value) deleteMemo,
    required TResult Function(UndoMemo value) undoMemo,
    required TResult Function(ChangeOrder value) changeOrder,
    required TResult Function(ToggleOrderSection value) toggleOrderSection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoEventCopyWith<$Res> {
  factory $MemoEventCopyWith(MemoEvent value, $Res Function(MemoEvent) then) =
      _$MemoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MemoEventCopyWithImpl<$Res> implements $MemoEventCopyWith<$Res> {
  _$MemoEventCopyWithImpl(this._value, this._then);

  final MemoEvent _value;
  // ignore: unused_field
  final $Res Function(MemoEvent) _then;
}

/// @nodoc
abstract class $LoadMemosCopyWith<$Res> {
  factory $LoadMemosCopyWith(LoadMemos value, $Res Function(LoadMemos) then) =
      _$LoadMemosCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadMemosCopyWithImpl<$Res> extends _$MemoEventCopyWithImpl<$Res>
    implements $LoadMemosCopyWith<$Res> {
  _$LoadMemosCopyWithImpl(LoadMemos _value, $Res Function(LoadMemos) _then)
      : super(_value, (v) => _then(v as LoadMemos));

  @override
  LoadMemos get _value => super._value as LoadMemos;
}

/// @nodoc

class _$LoadMemos implements LoadMemos {
  const _$LoadMemos();

  @override
  String toString() {
    return 'MemoEvent.loadMemos()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadMemos);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMemos,
    required TResult Function(Memo memo) deleteMemo,
    required TResult Function() undoMemo,
    required TResult Function(MemoOrder memoOrder) changeOrder,
    required TResult Function() toggleOrderSection,
  }) {
    return loadMemos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
  }) {
    return loadMemos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (loadMemos != null) {
      return loadMemos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMemos value) loadMemos,
    required TResult Function(DeleteMemo value) deleteMemo,
    required TResult Function(UndoMemo value) undoMemo,
    required TResult Function(ChangeOrder value) changeOrder,
    required TResult Function(ToggleOrderSection value) toggleOrderSection,
  }) {
    return loadMemos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
  }) {
    return loadMemos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (loadMemos != null) {
      return loadMemos(this);
    }
    return orElse();
  }
}

abstract class LoadMemos implements MemoEvent {
  const factory LoadMemos() = _$LoadMemos;
}

/// @nodoc
abstract class $DeleteMemoCopyWith<$Res> {
  factory $DeleteMemoCopyWith(
          DeleteMemo value, $Res Function(DeleteMemo) then) =
      _$DeleteMemoCopyWithImpl<$Res>;
  $Res call({Memo memo});

  $MemoCopyWith<$Res> get memo;
}

/// @nodoc
class _$DeleteMemoCopyWithImpl<$Res> extends _$MemoEventCopyWithImpl<$Res>
    implements $DeleteMemoCopyWith<$Res> {
  _$DeleteMemoCopyWithImpl(DeleteMemo _value, $Res Function(DeleteMemo) _then)
      : super(_value, (v) => _then(v as DeleteMemo));

  @override
  DeleteMemo get _value => super._value as DeleteMemo;

  @override
  $Res call({
    Object? memo = freezed,
  }) {
    return _then(DeleteMemo(
      memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Memo,
    ));
  }

  @override
  $MemoCopyWith<$Res> get memo {
    return $MemoCopyWith<$Res>(_value.memo, (value) {
      return _then(_value.copyWith(memo: value));
    });
  }
}

/// @nodoc

class _$DeleteMemo implements DeleteMemo {
  const _$DeleteMemo(this.memo);

  @override
  final Memo memo;

  @override
  String toString() {
    return 'MemoEvent.deleteMemo(memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteMemo &&
            const DeepCollectionEquality().equals(other.memo, memo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(memo));

  @JsonKey(ignore: true)
  @override
  $DeleteMemoCopyWith<DeleteMemo> get copyWith =>
      _$DeleteMemoCopyWithImpl<DeleteMemo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMemos,
    required TResult Function(Memo memo) deleteMemo,
    required TResult Function() undoMemo,
    required TResult Function(MemoOrder memoOrder) changeOrder,
    required TResult Function() toggleOrderSection,
  }) {
    return deleteMemo(memo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
  }) {
    return deleteMemo?.call(memo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (deleteMemo != null) {
      return deleteMemo(memo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMemos value) loadMemos,
    required TResult Function(DeleteMemo value) deleteMemo,
    required TResult Function(UndoMemo value) undoMemo,
    required TResult Function(ChangeOrder value) changeOrder,
    required TResult Function(ToggleOrderSection value) toggleOrderSection,
  }) {
    return deleteMemo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
  }) {
    return deleteMemo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (deleteMemo != null) {
      return deleteMemo(this);
    }
    return orElse();
  }
}

abstract class DeleteMemo implements MemoEvent {
  const factory DeleteMemo(Memo memo) = _$DeleteMemo;

  Memo get memo;
  @JsonKey(ignore: true)
  $DeleteMemoCopyWith<DeleteMemo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UndoMemoCopyWith<$Res> {
  factory $UndoMemoCopyWith(UndoMemo value, $Res Function(UndoMemo) then) =
      _$UndoMemoCopyWithImpl<$Res>;
}

/// @nodoc
class _$UndoMemoCopyWithImpl<$Res> extends _$MemoEventCopyWithImpl<$Res>
    implements $UndoMemoCopyWith<$Res> {
  _$UndoMemoCopyWithImpl(UndoMemo _value, $Res Function(UndoMemo) _then)
      : super(_value, (v) => _then(v as UndoMemo));

  @override
  UndoMemo get _value => super._value as UndoMemo;
}

/// @nodoc

class _$UndoMemo implements UndoMemo {
  const _$UndoMemo();

  @override
  String toString() {
    return 'MemoEvent.undoMemo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UndoMemo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMemos,
    required TResult Function(Memo memo) deleteMemo,
    required TResult Function() undoMemo,
    required TResult Function(MemoOrder memoOrder) changeOrder,
    required TResult Function() toggleOrderSection,
  }) {
    return undoMemo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
  }) {
    return undoMemo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (undoMemo != null) {
      return undoMemo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMemos value) loadMemos,
    required TResult Function(DeleteMemo value) deleteMemo,
    required TResult Function(UndoMemo value) undoMemo,
    required TResult Function(ChangeOrder value) changeOrder,
    required TResult Function(ToggleOrderSection value) toggleOrderSection,
  }) {
    return undoMemo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
  }) {
    return undoMemo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (undoMemo != null) {
      return undoMemo(this);
    }
    return orElse();
  }
}

abstract class UndoMemo implements MemoEvent {
  const factory UndoMemo() = _$UndoMemo;
}

/// @nodoc
abstract class $ChangeOrderCopyWith<$Res> {
  factory $ChangeOrderCopyWith(
          ChangeOrder value, $Res Function(ChangeOrder) then) =
      _$ChangeOrderCopyWithImpl<$Res>;
  $Res call({MemoOrder memoOrder});

  $MemoOrderCopyWith<$Res> get memoOrder;
}

/// @nodoc
class _$ChangeOrderCopyWithImpl<$Res> extends _$MemoEventCopyWithImpl<$Res>
    implements $ChangeOrderCopyWith<$Res> {
  _$ChangeOrderCopyWithImpl(
      ChangeOrder _value, $Res Function(ChangeOrder) _then)
      : super(_value, (v) => _then(v as ChangeOrder));

  @override
  ChangeOrder get _value => super._value as ChangeOrder;

  @override
  $Res call({
    Object? memoOrder = freezed,
  }) {
    return _then(ChangeOrder(
      memoOrder == freezed
          ? _value.memoOrder
          : memoOrder // ignore: cast_nullable_to_non_nullable
              as MemoOrder,
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

class _$ChangeOrder implements ChangeOrder {
  const _$ChangeOrder(this.memoOrder);

  @override
  final MemoOrder memoOrder;

  @override
  String toString() {
    return 'MemoEvent.changeOrder(memoOrder: $memoOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeOrder &&
            const DeepCollectionEquality().equals(other.memoOrder, memoOrder));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(memoOrder));

  @JsonKey(ignore: true)
  @override
  $ChangeOrderCopyWith<ChangeOrder> get copyWith =>
      _$ChangeOrderCopyWithImpl<ChangeOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMemos,
    required TResult Function(Memo memo) deleteMemo,
    required TResult Function() undoMemo,
    required TResult Function(MemoOrder memoOrder) changeOrder,
    required TResult Function() toggleOrderSection,
  }) {
    return changeOrder(memoOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
  }) {
    return changeOrder?.call(memoOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (changeOrder != null) {
      return changeOrder(memoOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMemos value) loadMemos,
    required TResult Function(DeleteMemo value) deleteMemo,
    required TResult Function(UndoMemo value) undoMemo,
    required TResult Function(ChangeOrder value) changeOrder,
    required TResult Function(ToggleOrderSection value) toggleOrderSection,
  }) {
    return changeOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
  }) {
    return changeOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (changeOrder != null) {
      return changeOrder(this);
    }
    return orElse();
  }
}

abstract class ChangeOrder implements MemoEvent {
  const factory ChangeOrder(MemoOrder memoOrder) = _$ChangeOrder;

  MemoOrder get memoOrder;
  @JsonKey(ignore: true)
  $ChangeOrderCopyWith<ChangeOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleOrderSectionCopyWith<$Res> {
  factory $ToggleOrderSectionCopyWith(
          ToggleOrderSection value, $Res Function(ToggleOrderSection) then) =
      _$ToggleOrderSectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$ToggleOrderSectionCopyWithImpl<$Res>
    extends _$MemoEventCopyWithImpl<$Res>
    implements $ToggleOrderSectionCopyWith<$Res> {
  _$ToggleOrderSectionCopyWithImpl(
      ToggleOrderSection _value, $Res Function(ToggleOrderSection) _then)
      : super(_value, (v) => _then(v as ToggleOrderSection));

  @override
  ToggleOrderSection get _value => super._value as ToggleOrderSection;
}

/// @nodoc

class _$ToggleOrderSection implements ToggleOrderSection {
  const _$ToggleOrderSection();

  @override
  String toString() {
    return 'MemoEvent.toggleOrderSection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ToggleOrderSection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMemos,
    required TResult Function(Memo memo) deleteMemo,
    required TResult Function() undoMemo,
    required TResult Function(MemoOrder memoOrder) changeOrder,
    required TResult Function() toggleOrderSection,
  }) {
    return toggleOrderSection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
  }) {
    return toggleOrderSection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMemos,
    TResult Function(Memo memo)? deleteMemo,
    TResult Function()? undoMemo,
    TResult Function(MemoOrder memoOrder)? changeOrder,
    TResult Function()? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (toggleOrderSection != null) {
      return toggleOrderSection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMemos value) loadMemos,
    required TResult Function(DeleteMemo value) deleteMemo,
    required TResult Function(UndoMemo value) undoMemo,
    required TResult Function(ChangeOrder value) changeOrder,
    required TResult Function(ToggleOrderSection value) toggleOrderSection,
  }) {
    return toggleOrderSection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
  }) {
    return toggleOrderSection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMemos value)? loadMemos,
    TResult Function(DeleteMemo value)? deleteMemo,
    TResult Function(UndoMemo value)? undoMemo,
    TResult Function(ChangeOrder value)? changeOrder,
    TResult Function(ToggleOrderSection value)? toggleOrderSection,
    required TResult orElse(),
  }) {
    if (toggleOrderSection != null) {
      return toggleOrderSection(this);
    }
    return orElse();
  }
}

abstract class ToggleOrderSection implements MemoEvent {
  const factory ToggleOrderSection() = _$ToggleOrderSection;
}
