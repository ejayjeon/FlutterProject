/* Domain layer에서 추상클래스로 구현한 REPO를 실제로 구현하는 부분 */

import 'package:flutter_note/data/data_source/note_db_helper.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDBHelper db; // db를 이곳에서 구현할 것

  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNote(note);
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async {
    await db.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
