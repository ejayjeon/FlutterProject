import 'package:flutter_note/data/data_source/note_db_helper.dart';
import 'package:flutter_note/data/repository/note_repository_impl.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';
import 'package:flutter_note/domain/use_case/add_note.dart';
import 'package:flutter_note/domain/use_case/delete_note.dart';
import 'package:flutter_note/domain/use_case/get_note_by_id.dart';
import 'package:flutter_note/domain/use_case/get_notes.dart';
import 'package:flutter_note/domain/use_case/update_note.dart';
import 'package:flutter_note/domain/use_case/use_cases.dart';
import 'package:flutter_note/presentation/view_model/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note/presentation/view_model/main_note/main_notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database db = await openDatabase(
    'note_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE note (id INTEGER AUTOINCREMENT, title TEXT, content TEXT, color NUM, timestamp TEXT)');
    },
  );

  NoteDBHelper noteDBHelper = NoteDBHelper(db);
  NoteRepository noteRepository = NoteRepositoryImpl(noteDBHelper);
  UseCases useCases = UseCases(
    addNote: AddNote(noteRepository),
    deleteNote: DeleteNote(noteRepository),
    getNoteById: GetNoteById(noteRepository),
    getNotes: GetNotes(noteRepository),
    updateNote: UpdateNote(noteRepository),
  );

  MainNotesViewModel notesViewModel = MainNotesViewModel(useCases);
  AddEditNoteViewModel addEditNoteViewModel =
      AddEditNoteViewModel(noteRepository);

  return [
    ChangeNotifierProvider(
      create: (_) => notesViewModel,
    ),
    ChangeNotifierProvider(
      create: (_) => addEditNoteViewModel,
    ),
  ];
}
