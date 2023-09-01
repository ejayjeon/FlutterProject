import 'package:flutter_note/data/data_source/note_db_helper.dart';
import 'package:flutter_note/data/repository/note_repository_impl.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';
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
  MainNotesViewModel notesViewModel = MainNotesViewModel(noteRepository);
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
