import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';

class GetNoteById {
  final NoteRepository repository;

  GetNoteById(this.repository);

  Future<Note?> call(int id) async {
    final note = await repository.getNoteById(id);
    return note;
  }
}
