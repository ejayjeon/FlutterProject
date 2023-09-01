import 'package:flutter/material.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_event.freezed.dart';

@freezed
abstract class AddEditNoteEvent with _$AddEditNoteEvent {
  const factory AddEditNoteEvent.changeColor(
      BuildContext context, Color currentColor) = ChangeColor;
  const factory AddEditNoteEvent.saveNote(Note? note) = SaveNote;
}
