// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotesState {
  List<Note> get notes => throw _privateConstructorUsedError;
  NoteOrder get noteOrder => throw _privateConstructorUsedError;
  bool get showOrderSection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotesStateCopyWith<NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res, NotesState>;
  @useResult
  $Res call({List<Note> notes, NoteOrder noteOrder, bool showOrderSection});

  $NoteOrderCopyWith<$Res> get noteOrder;
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res, $Val extends NotesState>
    implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? noteOrder = null,
    Object? showOrderSection = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      noteOrder: null == noteOrder
          ? _value.noteOrder
          : noteOrder // ignore: cast_nullable_to_non_nullable
              as NoteOrder,
      showOrderSection: null == showOrderSection
          ? _value.showOrderSection
          : showOrderSection // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteOrderCopyWith<$Res> get noteOrder {
    return $NoteOrderCopyWith<$Res>(_value.noteOrder, (value) {
      return _then(_value.copyWith(noteOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotesStateCopyWith<$Res>
    implements $NotesStateCopyWith<$Res> {
  factory _$$_NotesStateCopyWith(
          _$_NotesState value, $Res Function(_$_NotesState) then) =
      __$$_NotesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Note> notes, NoteOrder noteOrder, bool showOrderSection});

  @override
  $NoteOrderCopyWith<$Res> get noteOrder;
}

/// @nodoc
class __$$_NotesStateCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$_NotesState>
    implements _$$_NotesStateCopyWith<$Res> {
  __$$_NotesStateCopyWithImpl(
      _$_NotesState _value, $Res Function(_$_NotesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? noteOrder = null,
    Object? showOrderSection = null,
  }) {
    return _then(_$_NotesState(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      noteOrder: null == noteOrder
          ? _value.noteOrder
          : noteOrder // ignore: cast_nullable_to_non_nullable
              as NoteOrder,
      showOrderSection: null == showOrderSection
          ? _value.showOrderSection
          : showOrderSection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NotesState implements _NotesState {
  _$_NotesState(
      {required final List<Note> notes,
      required this.noteOrder,
      required this.showOrderSection})
      : _notes = notes;

  final List<Note> _notes;
  @override
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final NoteOrder noteOrder;
  @override
  final bool showOrderSection;

  @override
  String toString() {
    return 'NotesState(notes: $notes, noteOrder: $noteOrder, showOrderSection: $showOrderSection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotesState &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.noteOrder, noteOrder) ||
                other.noteOrder == noteOrder) &&
            (identical(other.showOrderSection, showOrderSection) ||
                other.showOrderSection == showOrderSection));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_notes), noteOrder, showOrderSection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotesStateCopyWith<_$_NotesState> get copyWith =>
      __$$_NotesStateCopyWithImpl<_$_NotesState>(this, _$identity);
}

abstract class _NotesState implements NotesState {
  factory _NotesState(
      {required final List<Note> notes,
      required final NoteOrder noteOrder,
      required final bool showOrderSection}) = _$_NotesState;

  @override
  List<Note> get notes;
  @override
  NoteOrder get noteOrder;
  @override
  bool get showOrderSection;
  @override
  @JsonKey(ignore: true)
  _$$_NotesStateCopyWith<_$_NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}
