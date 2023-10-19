import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_note/core/util/note_order.dart';
import 'package:flutter_note/core/util/order_type.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_note/domain/use_case/use_cases.dart';
import 'package:flutter_note/presentation/view_model/main_note/notes_event.dart'
    hide DeleteNote;
import 'package:flutter_note/presentation/view_model/main_note/notes_state.dart';

class MainNotesViewModel with ChangeNotifier {
  // final NoteRepository repository;

  // Use_case 사용은 REPOSITORY가 아니라 USECASE를 직접 받아서 사용한다
  final UseCases useCases;

  NotesState _state = NotesState(
    notes: [],
    noteOrder: NoteOrder.time(
      OrderType.desc(),
    ),
    showOrderSection: false,
  );
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
      changeOrder: _changeOrder,
      toggleOrderSection: _toggleOrderSection,
    );
  }

  Future<void> _toggleOrderSection() async {
    _state = state.copyWith(
      showOrderSection: !state.showOrderSection,
    );
    notifyListeners();
  }

  // 새로운 오더 입력이 들어오면 기존의 state를 변경해준다
  Future<void> _changeOrder(NoteOrder noteOrder) async {
    _state = state.copyWith(
      noteOrder: noteOrder,
    );
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    // List<Note> notes = await repository.getNotes();
    List<Note> notes = await useCases.getNotes(state.noteOrder);

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
