import 'package:flutter/material.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_ui_event.freezed.dart';

@freezed
abstract class AddEditNoteUiEvent with _$AddEditNoteUiEvent {
  const factory AddEditNoteUiEvent.saveNote() = SaveNote;
}
