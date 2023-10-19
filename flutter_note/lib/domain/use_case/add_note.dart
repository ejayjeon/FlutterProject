import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';

class AddNote {
  final NoteRepository repository;

  AddNote(this.repository);

  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}
