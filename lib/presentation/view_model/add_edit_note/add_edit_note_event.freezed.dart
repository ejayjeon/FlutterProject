// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_edit_note_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddEditNoteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, Color currentColor)
        changeColor,
    required TResult Function(Note? note) saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, Color currentColor)? changeColor,
    TResult? Function(Note? note)? saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, Color currentColor)? changeColor,
    TResult Function(Note? note)? saveNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SaveNote value) saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeColor value)? changeColor,
    TResult? Function(SaveNote value)? saveNote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveNote value)? saveNote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditNoteEventCopyWith<$Res> {
  factory $AddEditNoteEventCopyWith(
          AddEditNoteEvent value, $Res Function(AddEditNoteEvent) then) =
      _$AddEditNoteEventCopyWithImpl<$Res, AddEditNoteEvent>;
}

/// @nodoc
class _$AddEditNoteEventCopyWithImpl<$Res, $Val extends AddEditNoteEvent>
    implements $AddEditNoteEventCopyWith<$Res> {
  _$AddEditNoteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangeColorCopyWith<$Res> {
  factory _$$ChangeColorCopyWith(
          _$ChangeColor value, $Res Function(_$ChangeColor) then) =
      __$$ChangeColorCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, Color currentColor});
}

/// @nodoc
class __$$ChangeColorCopyWithImpl<$Res>
    extends _$AddEditNoteEventCopyWithImpl<$Res, _$ChangeColor>
    implements _$$ChangeColorCopyWith<$Res> {
  __$$ChangeColorCopyWithImpl(
      _$ChangeColor _value, $Res Function(_$ChangeColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? currentColor = null,
  }) {
    return _then(_$ChangeColor(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == currentColor
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ChangeColor implements ChangeColor {
  const _$ChangeColor(this.context, this.currentColor);

  @override
  final BuildContext context;
  @override
  final Color currentColor;

  @override
  String toString() {
    return 'AddEditNoteEvent.changeColor(context: $context, currentColor: $currentColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeColor &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.currentColor, currentColor) ||
                other.currentColor == currentColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, currentColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeColorCopyWith<_$ChangeColor> get copyWith =>
      __$$ChangeColorCopyWithImpl<_$ChangeColor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, Color currentColor)
        changeColor,
    required TResult Function(Note? note) saveNote,
  }) {
    return changeColor(context, currentColor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, Color currentColor)? changeColor,
    TResult? Function(Note? note)? saveNote,
  }) {
    return changeColor?.call(context, currentColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, Color currentColor)? changeColor,
    TResult Function(Note? note)? saveNote,
    required TResult orElse(),
  }) {
    if (changeColor != null) {
      return changeColor(context, currentColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SaveNote value) saveNote,
  }) {
    return changeColor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeColor value)? changeColor,
    TResult? Function(SaveNote value)? saveNote,
  }) {
    return changeColor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveNote value)? saveNote,
    required TResult orElse(),
  }) {
    if (changeColor != null) {
      return changeColor(this);
    }
    return orElse();
  }
}

abstract class ChangeColor implements AddEditNoteEvent {
  const factory ChangeColor(
      final BuildContext context, final Color currentColor) = _$ChangeColor;

  BuildContext get context;
  Color get currentColor;
  @JsonKey(ignore: true)
  _$$ChangeColorCopyWith<_$ChangeColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveNoteCopyWith<$Res> {
  factory _$$SaveNoteCopyWith(
          _$SaveNote value, $Res Function(_$SaveNote) then) =
      __$$SaveNoteCopyWithImpl<$Res>;
  @useResult
  $Res call({Note? note});

  $NoteCopyWith<$Res>? get note;
}

/// @nodoc
class __$$SaveNoteCopyWithImpl<$Res>
    extends _$AddEditNoteEventCopyWithImpl<$Res, _$SaveNote>
    implements _$$SaveNoteCopyWith<$Res> {
  __$$SaveNoteCopyWithImpl(_$SaveNote _value, $Res Function(_$SaveNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(_$SaveNote(
      freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res>? get note {
    if (_value.note == null) {
      return null;
    }

    return $NoteCopyWith<$Res>(_value.note!, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc

class _$SaveNote implements SaveNote {
  const _$SaveNote(this.note);

  @override
  final Note? note;

  @override
  String toString() {
    return 'AddEditNoteEvent.saveNote(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveNote &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveNoteCopyWith<_$SaveNote> get copyWith =>
      __$$SaveNoteCopyWithImpl<_$SaveNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, Color currentColor)
        changeColor,
    required TResult Function(Note? note) saveNote,
  }) {
    return saveNote(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, Color currentColor)? changeColor,
    TResult? Function(Note? note)? saveNote,
  }) {
    return saveNote?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, Color currentColor)? changeColor,
    TResult Function(Note? note)? saveNote,
    required TResult orElse(),
  }) {
    if (saveNote != null) {
      return saveNote(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeColor value) changeColor,
    required TResult Function(SaveNote value) saveNote,
  }) {
    return saveNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeColor value)? changeColor,
    TResult? Function(SaveNote value)? saveNote,
  }) {
    return saveNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeColor value)? changeColor,
    TResult Function(SaveNote value)? saveNote,
    required TResult orElse(),
  }) {
    if (saveNote != null) {
      return saveNote(this);
    }
    return orElse();
  }
}

abstract class SaveNote implements AddEditNoteEvent {
  const factory SaveNote(final Note? note) = _$SaveNote;

  Note? get note;
  @JsonKey(ignore: true)
  _$$SaveNoteCopyWith<_$SaveNote> get copyWith =>
      throw _privateConstructorUsedError;
}
