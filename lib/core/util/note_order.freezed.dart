// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteOrder {
  OrderType get orderType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderType orderType) title,
    required TResult Function(OrderType orderType) time,
    required TResult Function(OrderType orderType) color,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderType orderType)? title,
    TResult? Function(OrderType orderType)? time,
    TResult? Function(OrderType orderType)? color,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? time,
    TResult Function(OrderType orderType)? color,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoteOrderByTitle value) title,
    required TResult Function(NoteOrderByTime value) time,
    required TResult Function(NoteOrderByColor value) color,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoteOrderByTitle value)? title,
    TResult? Function(NoteOrderByTime value)? time,
    TResult? Function(NoteOrderByColor value)? color,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoteOrderByTitle value)? title,
    TResult Function(NoteOrderByTime value)? time,
    TResult Function(NoteOrderByColor value)? color,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteOrderCopyWith<NoteOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteOrderCopyWith<$Res> {
  factory $NoteOrderCopyWith(NoteOrder value, $Res Function(NoteOrder) then) =
      _$NoteOrderCopyWithImpl<$Res, NoteOrder>;
  @useResult
  $Res call({OrderType orderType});

  $OrderTypeCopyWith<$Res> get orderType;
}

/// @nodoc
class _$NoteOrderCopyWithImpl<$Res, $Val extends NoteOrder>
    implements $NoteOrderCopyWith<$Res> {
  _$NoteOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderType = null,
  }) {
    return _then(_value.copyWith(
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderTypeCopyWith<$Res> get orderType {
    return $OrderTypeCopyWith<$Res>(_value.orderType, (value) {
      return _then(_value.copyWith(orderType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NoteOrderByTitleCopyWith<$Res>
    implements $NoteOrderCopyWith<$Res> {
  factory _$$NoteOrderByTitleCopyWith(
          _$NoteOrderByTitle value, $Res Function(_$NoteOrderByTitle) then) =
      __$$NoteOrderByTitleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderType orderType});

  @override
  $OrderTypeCopyWith<$Res> get orderType;
}

/// @nodoc
class __$$NoteOrderByTitleCopyWithImpl<$Res>
    extends _$NoteOrderCopyWithImpl<$Res, _$NoteOrderByTitle>
    implements _$$NoteOrderByTitleCopyWith<$Res> {
  __$$NoteOrderByTitleCopyWithImpl(
      _$NoteOrderByTitle _value, $Res Function(_$NoteOrderByTitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderType = null,
  }) {
    return _then(_$NoteOrderByTitle(
      null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }
}

/// @nodoc

class _$NoteOrderByTitle implements NoteOrderByTitle {
  const _$NoteOrderByTitle(this.orderType);

  @override
  final OrderType orderType;

  @override
  String toString() {
    return 'NoteOrder.title(orderType: $orderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteOrderByTitle &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteOrderByTitleCopyWith<_$NoteOrderByTitle> get copyWith =>
      __$$NoteOrderByTitleCopyWithImpl<_$NoteOrderByTitle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderType orderType) title,
    required TResult Function(OrderType orderType) time,
    required TResult Function(OrderType orderType) color,
  }) {
    return title(orderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderType orderType)? title,
    TResult? Function(OrderType orderType)? time,
    TResult? Function(OrderType orderType)? color,
  }) {
    return title?.call(orderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? time,
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
    required TResult Function(NoteOrderByTitle value) title,
    required TResult Function(NoteOrderByTime value) time,
    required TResult Function(NoteOrderByColor value) color,
  }) {
    return title(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoteOrderByTitle value)? title,
    TResult? Function(NoteOrderByTime value)? time,
    TResult? Function(NoteOrderByColor value)? color,
  }) {
    return title?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoteOrderByTitle value)? title,
    TResult Function(NoteOrderByTime value)? time,
    TResult Function(NoteOrderByColor value)? color,
    required TResult orElse(),
  }) {
    if (title != null) {
      return title(this);
    }
    return orElse();
  }
}

abstract class NoteOrderByTitle implements NoteOrder {
  const factory NoteOrderByTitle(final OrderType orderType) =
      _$NoteOrderByTitle;

  @override
  OrderType get orderType;
  @override
  @JsonKey(ignore: true)
  _$$NoteOrderByTitleCopyWith<_$NoteOrderByTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoteOrderByTimeCopyWith<$Res>
    implements $NoteOrderCopyWith<$Res> {
  factory _$$NoteOrderByTimeCopyWith(
          _$NoteOrderByTime value, $Res Function(_$NoteOrderByTime) then) =
      __$$NoteOrderByTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderType orderType});

  @override
  $OrderTypeCopyWith<$Res> get orderType;
}

/// @nodoc
class __$$NoteOrderByTimeCopyWithImpl<$Res>
    extends _$NoteOrderCopyWithImpl<$Res, _$NoteOrderByTime>
    implements _$$NoteOrderByTimeCopyWith<$Res> {
  __$$NoteOrderByTimeCopyWithImpl(
      _$NoteOrderByTime _value, $Res Function(_$NoteOrderByTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderType = null,
  }) {
    return _then(_$NoteOrderByTime(
      null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }
}

/// @nodoc

class _$NoteOrderByTime implements NoteOrderByTime {
  const _$NoteOrderByTime(this.orderType);

  @override
  final OrderType orderType;

  @override
  String toString() {
    return 'NoteOrder.time(orderType: $orderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteOrderByTime &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteOrderByTimeCopyWith<_$NoteOrderByTime> get copyWith =>
      __$$NoteOrderByTimeCopyWithImpl<_$NoteOrderByTime>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderType orderType) title,
    required TResult Function(OrderType orderType) time,
    required TResult Function(OrderType orderType) color,
  }) {
    return time(orderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderType orderType)? title,
    TResult? Function(OrderType orderType)? time,
    TResult? Function(OrderType orderType)? color,
  }) {
    return time?.call(orderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? time,
    TResult Function(OrderType orderType)? color,
    required TResult orElse(),
  }) {
    if (time != null) {
      return time(orderType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoteOrderByTitle value) title,
    required TResult Function(NoteOrderByTime value) time,
    required TResult Function(NoteOrderByColor value) color,
  }) {
    return time(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoteOrderByTitle value)? title,
    TResult? Function(NoteOrderByTime value)? time,
    TResult? Function(NoteOrderByColor value)? color,
  }) {
    return time?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoteOrderByTitle value)? title,
    TResult Function(NoteOrderByTime value)? time,
    TResult Function(NoteOrderByColor value)? color,
    required TResult orElse(),
  }) {
    if (time != null) {
      return time(this);
    }
    return orElse();
  }
}

abstract class NoteOrderByTime implements NoteOrder {
  const factory NoteOrderByTime(final OrderType orderType) = _$NoteOrderByTime;

  @override
  OrderType get orderType;
  @override
  @JsonKey(ignore: true)
  _$$NoteOrderByTimeCopyWith<_$NoteOrderByTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoteOrderByColorCopyWith<$Res>
    implements $NoteOrderCopyWith<$Res> {
  factory _$$NoteOrderByColorCopyWith(
          _$NoteOrderByColor value, $Res Function(_$NoteOrderByColor) then) =
      __$$NoteOrderByColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderType orderType});

  @override
  $OrderTypeCopyWith<$Res> get orderType;
}

/// @nodoc
class __$$NoteOrderByColorCopyWithImpl<$Res>
    extends _$NoteOrderCopyWithImpl<$Res, _$NoteOrderByColor>
    implements _$$NoteOrderByColorCopyWith<$Res> {
  __$$NoteOrderByColorCopyWithImpl(
      _$NoteOrderByColor _value, $Res Function(_$NoteOrderByColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderType = null,
  }) {
    return _then(_$NoteOrderByColor(
      null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
    ));
  }
}

/// @nodoc

class _$NoteOrderByColor implements NoteOrderByColor {
  const _$NoteOrderByColor(this.orderType);

  @override
  final OrderType orderType;

  @override
  String toString() {
    return 'NoteOrder.color(orderType: $orderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteOrderByColor &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteOrderByColorCopyWith<_$NoteOrderByColor> get copyWith =>
      __$$NoteOrderByColorCopyWithImpl<_$NoteOrderByColor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderType orderType) title,
    required TResult Function(OrderType orderType) time,
    required TResult Function(OrderType orderType) color,
  }) {
    return color(orderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderType orderType)? title,
    TResult? Function(OrderType orderType)? time,
    TResult? Function(OrderType orderType)? color,
  }) {
    return color?.call(orderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderType orderType)? title,
    TResult Function(OrderType orderType)? time,
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
    required TResult Function(NoteOrderByTitle value) title,
    required TResult Function(NoteOrderByTime value) time,
    required TResult Function(NoteOrderByColor value) color,
  }) {
    return color(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoteOrderByTitle value)? title,
    TResult? Function(NoteOrderByTime value)? time,
    TResult? Function(NoteOrderByColor value)? color,
  }) {
    return color?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoteOrderByTitle value)? title,
    TResult Function(NoteOrderByTime value)? time,
    TResult Function(NoteOrderByColor value)? color,
    required TResult orElse(),
  }) {
    if (color != null) {
      return color(this);
    }
    return orElse();
  }
}

abstract class NoteOrderByColor implements NoteOrder {
  const factory NoteOrderByColor(final OrderType orderType) =
      _$NoteOrderByColor;

  @override
  OrderType get orderType;
  @override
  @JsonKey(ignore: true)
  _$$NoteOrderByColorCopyWith<_$NoteOrderByColor> get copyWith =>
      throw _privateConstructorUsedError;
}
