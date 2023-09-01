import 'package:flutter/material.dart';
import 'package:flutter_note/presentation/view/add_edit_note/add_edit_note_screen.dart';
import 'package:flutter_note/presentation/view/main_note/components/note_item.dart';
import 'package:flutter_note/presentation/view/main_note/components/snackbar.dart';
import 'package:flutter_note/presentation/view_model/main_note/main_notes_view_model.dart';
import 'package:flutter_note/presentation/view_model/main_note/notes_event.dart';
import 'package:provider/provider.dart';

class MainNoteScreen extends StatefulWidget {
  const MainNoteScreen({super.key});

  @override
  State<MainNoteScreen> createState() => _MainNoteScreenState();
}

class _MainNoteScreenState extends State<MainNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainNotesViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute<bool>(
              builder: (BuildContext context) => const AddEditNoteScreen(),
            ),
          );
          viewModel.onEvent(const NotesEvent.loadNotes());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: state.notes
              .map(
                (note) => GestureDetector(
                  onTap: () async {
                    print(note);
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddEditNoteScreen(
                          note: note,
                        ),
                      ),
                    );
                  },
                  child: NoteItem(
                    note: note,
                    onDeletePressed: (context) {
                      viewModel.onEvent(NotesEvent.deleteNote(note));
                      showSnackbar(
                        title: '노트가 삭제되었습니다',
                        context: context,
                        needRestore: true,
                        onRestorePressed: () {
                          viewModel.onEvent(const NotesEvent.restoreNote());
                        },
                      );
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
