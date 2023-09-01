// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() desc,
    required TResult Function() asc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? desc,
    TResult? Function()? asc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? desc,
    TResult Function()? asc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Desc value) desc,
    required TResult Function(Asc value) asc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Desc value)? desc,
    TResult? Function(Asc value)? asc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Desc value)? desc,
    TResult Function(Asc value)? asc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTypeCopyWith<$Res> {
  factory $OrderTypeCopyWith(OrderType value, $Res Function(OrderType) then) =
      _$OrderTypeCopyWithImpl<$Res, OrderType>;
}

/// @nodoc
class _$OrderTypeCopyWithImpl<$Res, $Val extends OrderType>
    implements $OrderTypeCopyWith<$Res> {
  _$OrderTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DescCopyWith<$Res> {
  factory _$$DescCopyWith(_$Desc value, $Res Function(_$Desc) then) =
      __$$DescCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DescCopyWithImpl<$Res> extends _$OrderTypeCopyWithImpl<$Res, _$Desc>
    implements _$$DescCopyWith<$Res> {
  __$$DescCopyWithImpl(_$Desc _value, $Res Function(_$Desc) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Desc implements Desc {
  const _$Desc();

  @override
  String toString() {
    return 'OrderType.desc()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Desc);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() desc,
    required TResult Function() asc,
  }) {
    return desc();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? desc,
    TResult? Function()? asc,
  }) {
    return desc?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? desc,
    TResult Function()? asc,
    required TResult orElse(),
  }) {
    if (desc != null) {
      return desc();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Desc value) desc,
    required TResult Function(Asc value) asc,
  }) {
    return desc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Desc value)? desc,
    TResult? Function(Asc value)? asc,
  }) {
    return desc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Desc value)? desc,
    TResult Function(Asc value)? asc,
    required TResult orElse(),
  }) {
    if (desc != null) {
      return desc(this);
    }
    return orElse();
  }
}

abstract class Desc implements OrderType {
  const factory Desc() = _$Desc;
}

/// @nodoc
abstract class _$$AscCopyWith<$Res> {
  factory _$$AscCopyWith(_$Asc value, $Res Function(_$Asc) then) =
      __$$AscCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AscCopyWithImpl<$Res> extends _$OrderTypeCopyWithImpl<$Res, _$Asc>
    implements _$$AscCopyWith<$Res> {
  __$$AscCopyWithImpl(_$Asc _value, $Res Function(_$Asc) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Asc implements Asc {
  const _$Asc();

  @override
  String toString() {
    return 'OrderType.asc()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Asc);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() desc,
    required TResult Function() asc,
  }) {
    return asc();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? desc,
    TResult? Function()? asc,
  }) {
    return asc?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? desc,
    TResult Function()? asc,
    required TResult orElse(),
  }) {
    if (asc != null) {
      return asc();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Desc value) desc,
    required TResult Function(Asc value) asc,
  }) {
    return asc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Desc value)? desc,
    TResult? Function(Asc value)? asc,
  }) {
    return asc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Desc value)? desc,
    TResult Function(Asc value)? asc,
    required TResult orElse(),
  }) {
    if (asc != null) {
      return asc(this);
    }
    return orElse();
  }
}

abstract class Asc implements OrderType {
  const factory Asc() = _$Asc;
}
