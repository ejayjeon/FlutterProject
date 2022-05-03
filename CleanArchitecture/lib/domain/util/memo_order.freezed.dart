// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memo_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MemoOrderTearOff {
  const _$MemoOrderTearOff();

  MemoOrderTitle title(OrderType orderType) {
    return MemoOrderTitle(
      orderType,
    );
  }

  MemoOrderDate date(OrderType orderType) {
    return MemoOrderDate(
      orderType,
    );
  }

  MemoOrderColor color(OrderType orderType) {
    return MemoOrderColor(
      orderType,
    );
  }
}

/// @nodoc
const $MemoOrder = _$MemoOrderTearOff();

/// @nodoc
mixin _$MemoOrder {
  OrderType get orderType => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderType orderType) title,
    required TResult Function(OrderType orderType) date,
    required TResult Function(OrderType orderType) color,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? date,
    TResult Function(OrderType orderType)? color,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? date,
    TResult Function(OrderType orderType)? color,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemoOrderTitle value) title,
    required TResult Function(MemoOrderDate value) date,
    required TResult Function(MemoOrderColor value) color,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MemoOrderTitle value)? title,
    TResult Function(MemoOrderDate value)? date,
    TResult Function(MemoOrderColor value)? color,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoOrderTitle value)? title,
    TResult Function(MemoOrderDate value)? date,
    TResult Function(MemoOrderColor value)? color,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemoOrderCopyWith<MemoOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoOrderCopyWith<$Res> {
  factory $MemoOrderCopyWith(MemoOrder value, $Res Function(MemoOrder) then) =
      _$MemoOrderCopyWithImpl<$Res>;
  $Res call({OrderType orderType});

  $OrderTypeCopyWith<$Res> get orderType;
}

/// @nodoc
class _$MemoOrderCopyWithImpl<$Res> implements $MemoOrderCopyWith<$Res> {
  _$MemoOrderCopyWithImpl(this._value, this._then);

  final MemoOrder _value;
  // ignore: unused_field
  final $Res Function(MemoOrder) _then;

  @override
  $Res call({
    Object? orderType = freezed,
  }) {
    return _then(_value.copyWith(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }

  @override
  $OrderTypeCopyWith<$Res> get orderType {
    return $OrderTypeCopyWith<$Res>(_value.orderType, (value) {
      return _then(_value.copyWith(orderType: value));
    });
  }
}

/// @nodoc
abstract class $MemoOrderTitleCopyWith<$Res>
    implements $MemoOrderCopyWith<$Res> {
  factory $MemoOrderTitleCopyWith(
          MemoOrderTitle value, $Res Function(MemoOrderTitle) then) =
      _$MemoOrderTitleCopyWithImpl<$Res>;
  @override
  $Res call({OrderType orderType});

  @override
  $OrderTypeCopyWith<$Res> get orderType;
}

/// @nodoc
class _$MemoOrderTitleCopyWithImpl<$Res> extends _$MemoOrderCopyWithImpl<$Res>
    implements $MemoOrderTitleCopyWith<$Res> {
  _$MemoOrderTitleCopyWithImpl(
      MemoOrderTitle _value, $Res Function(MemoOrderTitle) _then)
      : super(_value, (v) => _then(v as MemoOrderTitle));

  @override
  MemoOrderTitle get _value => super._value as MemoOrderTitle;

  @override
  $Res call({
    Object? orderType = freezed,
  }) {
    return _then(MemoOrderTitle(
      orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }
}

/// @nodoc

class _$MemoOrderTitle implements MemoOrderTitle {
  const _$MemoOrderTitle(this.orderType);

  @override
  final OrderType orderType;

  @override
  String toString() {
    return 'MemoOrder.title(orderType: $orderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemoOrderTitle &&
            const DeepCollectionEquality().equals(other.orderType, orderType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(orderType));

  @JsonKey(ignore: true)
  @override
  $MemoOrderTitleCopyWith<MemoOrderTitle> get copyWith =>
      _$MemoOrderTitleCopyWithImpl<MemoOrderTitle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderType orderType) title,
    required TResult Function(OrderType orderType) date,
    required TResult Function(OrderType orderType) color,
  }) {
    return title(orderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? date,
    TResult Function(OrderType orderType)? color,
  }) {
    return title?.call(orderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? date,
    TResult Function(OrderType orderType)? color,
    required TResult orElse(),
  }) {
    if (title != null) {
      return title(orderType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemoOrderTitle value) title,
    required TResult Function(MemoOrderDate value) date,
    required TResult Function(MemoOrderColor value) color,
  }) {
    return title(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MemoOrderTitle value)? title,
    TResult Function(MemoOrderDate value)? date,
    TResult Function(MemoOrderColor value)? color,
  }) {
    return title?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoOrderTitle value)? title,
    TResult Function(MemoOrderDate value)? date,
    TResult Function(MemoOrderColor value)? color,
    required TResult orElse(),
  }) {
    if (title != null) {
      return title(this);
    }
    return orElse();
  }
}

abstract class MemoOrderTitle implements MemoOrder {
  const factory MemoOrderTitle(OrderType orderType) = _$MemoOrderTitle;

  @override
  OrderType get orderType;
  @override
  @JsonKey(ignore: true)
  $MemoOrderTitleCopyWith<MemoOrderTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoOrderDateCopyWith<$Res>
    implements $MemoOrderCopyWith<$Res> {
  factory $MemoOrderDateCopyWith(
          MemoOrderDate value, $Res Function(MemoOrderDate) then) =
      _$MemoOrderDateCopyWithImpl<$Res>;
  @override
  $Res call({OrderType orderType});

  @override
  $OrderTypeCopyWith<$Res> get orderType;
}

/// @nodoc
class _$MemoOrderDateCopyWithImpl<$Res> extends _$MemoOrderCopyWithImpl<$Res>
    implements $MemoOrderDateCopyWith<$Res> {
  _$MemoOrderDateCopyWithImpl(
      MemoOrderDate _value, $Res Function(MemoOrderDate) _then)
      : super(_value, (v) => _then(v as MemoOrderDate));

  @override
  MemoOrderDate get _value => super._value as MemoOrderDate;

  @override
  $Res call({
    Object? orderType = freezed,
  }) {
    return _then(MemoOrderDate(
      orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }
}

/// @nodoc

class _$MemoOrderDate implements MemoOrderDate {
  const _$MemoOrderDate(this.orderType);

  @override
  final OrderType orderType;

  @override
  String toString() {
    return 'MemoOrder.date(orderType: $orderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemoOrderDate &&
            const DeepCollectionEquality().equals(other.orderType, orderType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(orderType));

  @JsonKey(ignore: true)
  @override
  $MemoOrderDateCopyWith<MemoOrderDate> get copyWith =>
      _$MemoOrderDateCopyWithImpl<MemoOrderDate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderType orderType) title,
    required TResult Function(OrderType orderType) date,
    required TResult Function(OrderType orderType) color,
  }) {
    return date(orderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? date,
    TResult Function(OrderType orderType)? color,
  }) {
    return date?.call(orderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? date,
    TResult Function(OrderType orderType)? color,
    required TResult orElse(),
  }) {
    if (date != null) {
      return date(orderType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemoOrderTitle value) title,
    required TResult Function(MemoOrderDate value) date,
    required TResult Function(MemoOrderColor value) color,
  }) {
    return date(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MemoOrderTitle value)? title,
    TResult Function(MemoOrderDate value)? date,
    TResult Function(MemoOrderColor value)? color,
  }) {
    return date?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoOrderTitle value)? title,
    TResult Function(MemoOrderDate value)? date,
    TResult Function(MemoOrderColor value)? color,
    required TResult orElse(),
  }) {
    if (date != null) {
      return date(this);
    }
    return orElse();
  }
}

abstract class MemoOrderDate implements MemoOrder {
  const factory MemoOrderDate(OrderType orderType) = _$MemoOrderDate;

  @override
  OrderType get orderType;
  @override
  @JsonKey(ignore: true)
  $MemoOrderDateCopyWith<MemoOrderDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoOrderColorCopyWith<$Res>
    implements $MemoOrderCopyWith<$Res> {
  factory $MemoOrderColorCopyWith(
          MemoOrderColor value, $Res Function(MemoOrderColor) then) =
      _$MemoOrderColorCopyWithImpl<$Res>;
  @override
  $Res call({OrderType orderType});

  @override
  $OrderTypeCopyWith<$Res> get orderType;
}

/// @nodoc
class _$MemoOrderColorCopyWithImpl<$Res> extends _$MemoOrderCopyWithImpl<$Res>
    implements $MemoOrderColorCopyWith<$Res> {
  _$MemoOrderColorCopyWithImpl(
      MemoOrderColor _value, $Res Function(MemoOrderColor) _then)
      : super(_value, (v) => _then(v as MemoOrderColor));

  @override
  MemoOrderColor get _value => super._value as MemoOrderColor;

  @override
  $Res call({
    Object? orderType = freezed,
  }) {
    return _then(MemoOrderColor(
      orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }
}

/// @nodoc

class _$MemoOrderColor implements MemoOrderColor {
  const _$MemoOrderColor(this.orderType);

  @override
  final OrderType orderType;

  @override
  String toString() {
    return 'MemoOrder.color(orderType: $orderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemoOrderColor &&
            const DeepCollectionEquality().equals(other.orderType, orderType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(orderType));

  @JsonKey(ignore: true)
  @override
  $MemoOrderColorCopyWith<MemoOrderColor> get copyWith =>
      _$MemoOrderColorCopyWithImpl<MemoOrderColor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderType orderType) title,
    required TResult Function(OrderType orderType) date,
    required TResult Function(OrderType orderType) color,
  }) {
    return color(orderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? date,
    TResult Function(OrderType orderType)? color,
  }) {
    return color?.call(orderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? date,
    TResult Function(OrderType orderType)? color,
    required TResult orElse(),
  }) {
    if (color != null) {
      return color(orderType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemoOrderTitle value) title,
    required TResult Function(MemoOrderDate value) date,
    required TResult Function(MemoOrderColor value) color,
  }) {
    return color(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MemoOrderTitle value)? title,
    TResult Function(MemoOrderDate value)? date,
    TResult Function(MemoOrderColor value)? color,
  }) {
    return color?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoOrderTitle value)? title,
    TResult Function(MemoOrderDate value)? date,
    TResult Function(MemoOrderColor value)? color,
    required TResult orElse(),
  }) {
    if (color != null) {
      return color(this);
    }
    return orElse();
  }
}

abstract class MemoOrderColor implements MemoOrder {
  const factory MemoOrderColor(OrderType orderType) = _$MemoOrderColor;

  @override
  OrderType get orderType;
  @override
  @JsonKey(ignore: true)
  $MemoOrderColorCopyWith<MemoOrderColor> get copyWith =>
      throw _privateConstructorUsedError;
}
