import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';
import 'package:flutter_note/domain/use_case/add_note.dart';
import 'package:flutter_note/domain/use_case/get_notes.dart';
import 'package:flutter_note/domain/use_case/delete_note.dart';
import 'package:flutter_note/domain/use_case/use_cases.dart';
import 'package:flutter_note/presentation/view_model/main_note/notes_event.dart'
    hide DeleteNote;
import 'package:flutter_note/presentation/view_model/main_note/notes_state.dart';

class MainNotesViewModel with ChangeNotifier {
  // final NoteRepository repository;

  // Use_case 사용은 REPOSITORY가 아니라 USECASE를 직접 받아서 사용한다
  final UseCases useCases;

  NotesState _state = NotesState(notes: []);
  NotesState get state => _state;

  // List<Note> _notes = [];
  // UnmodifiableListView<Note> get note => UnmodifiableListView(_notes);
  Note? _recentlyDeletedNote;

  MainNotesViewModel(
    this.useCases,
  ) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    // List<Note> notes = await repository.getNotes();
    List<Note> notes = await useCases.getNotes();

    // _notes = notes;
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    // await repository.deleteNote(note);
    await useCases.deleteNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
