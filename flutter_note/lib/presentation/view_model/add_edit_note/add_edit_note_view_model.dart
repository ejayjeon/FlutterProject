import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';
import 'package:flutter_note/presentation/view/add_edit_note/add_edit_note_ui_event.dart';
import 'package:flutter_note/presentation/view_model/add_edit_note/add_edit_note_event.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  Color currentColor = Color(0xFFFFFFFF);
  Color pickerColor = Color(0xFFFFFFFF);

  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();
  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  Future _changeColor(BuildContext context, Color currentColor) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: currentColor,
              onColorChanged: (value) {
                pickerColor = value;
                notifyListeners();
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future _saveNote(Note? note) async {
    if (note!.id == null) {
      await repository.insertNote(
        Note(
          title: note.title,
          content: note.content,
          color: note.color,
          timestamp: note.timestamp,
          id: (await repository.getNotes()).length + 1,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
          title: note.title,
          content: note.content,
          color: note.color,
          timestamp: note.timestamp,
          id: note.id,
        ),
      );
    }
    // _eventController.add(AddEditNoteUiEvent.saveNote());
  }
}
