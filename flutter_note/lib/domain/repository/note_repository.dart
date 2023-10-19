/*
NOTE 가 전체 어플리케이션에서 어떤 기능을 하는지 나열
 */

import 'package:flutter_note/domain/model/note.dart';

abstract class NoteRepository {
  // DB에 저장된 기능들을 가지고 옴
  Future<List<Note>> getNotes();

  // 화면에서 클릭을 하면 ID로 식별하여 해당 note를 가지고 옴
  Future<Note?> getNoteById(int id);

  // note를 추가
  Future<void> insertNote(Note note);

  // note를 업데이트
  Future<void> updateNote(Note note);

  // note를 삭제
  Future<void> deleteNote(Note note);

  // note를 정렬
}
