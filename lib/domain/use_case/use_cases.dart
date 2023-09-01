import 'package:flutter_note/domain/use_case/add_note.dart';
import 'package:flutter_note/domain/use_case/delete_note.dart';
import 'package:flutter_note/domain/use_case/get_note_by_id.dart';
import 'package:flutter_note/domain/use_case/get_notes.dart';
import 'package:flutter_note/domain/use_case/update_note.dart';

class UseCases {
  final AddNote addNote;
  final DeleteNote deleteNote;
  final GetNoteById getNoteById;
  final GetNotes getNotes;
  final UpdateNote updateNote;

  UseCases({
    required this.addNote,
    required this.deleteNote,
    required this.getNoteById,
    required this.getNotes,
    required this.updateNote,
  });
}
