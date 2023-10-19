import 'package:flutter_note/core/util/note_order.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    required List<Note> notes,
    required NoteOrder noteOrder,
    required bool showOrderSection,
  }) = _NotesState;
}
