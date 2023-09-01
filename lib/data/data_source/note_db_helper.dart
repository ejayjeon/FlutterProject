/* DB_Helper */

import 'package:sqflite/sqflite.dart';

import 'package:flutter_note/domain/model/note.dart';

enum TableName { note }

class NoteDBHelper {
  Database db;
  NoteDBHelper(this.db);

  // 1. id에 따라 note 가지고 오는 로직
  Future<Note?> getNoteById(int id) async {
    // SELECT * FROM NOTE WHERE ID = 1
    final List<Map<String, dynamic>> maps = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );

    // id는 하나뿐이기 때문에 무조건 한 개만 가지고 올 것
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }
    return null;
  }

  // 2. 전체 notes를 가지고 오는 로직
  Future<List<Note>> getNotes() async {
    // notes 전체 리스트 -> LIST 형태로 변환
    final maps = await db.query(
      'note',
    );
    return maps.map((e) => Note.fromJson(e)).toList();
  }

  // 3. note를 추가하는 로직
  Future<void> insertNote(Note note) async {
    // RETURN은 추가한 값의 ID를 리턴
    await db.insert(
      'note',
      note.toJson(),
    );
  }

  // 4. note ID를 받아서 업데이트 하는 로직
  Future<void> updateNote(Note note) async {
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // 5. note id를 받아서 삭제하는 로직
  Future<void> deleteNote(Note note) async {
    await db.delete(
      'note',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
