import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_note/presentation/view/main_note/components/snackbar.dart';
import 'package:flutter_note/presentation/view_model/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note/presentation/view_model/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note/presentation/view_model/main_note/main_notes_view_model.dart';
import 'package:flutter_note/presentation/view_model/main_note/notes_event.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;
  const AddEditNoteScreen({
    super.key,
    this.note,
  });

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  late final TextEditingController titleController;
  late final TextEditingController contentController;
  final _formKey = GlobalKey<FormState>();
  StreamSubscription? _streamSubscription;
  late final int currentColor;
  String _updateTitle = '';
  String _updateContent = '';

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();

    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
      currentColor = widget.note!.color;
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();

      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(saveNote: () {
          Navigator.pop(context, true);
        });
      });
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();
    final noteViewModel = context.watch<MainNotesViewModel>();
    Color currentColor = Color(0xFFFFFFFF);

    return Form(
      key: _formKey,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (widget.note != null) {
              viewModel.onEvent(
                AddEditNoteEvent.saveNote(
                  Note(
                    id: widget.note!.id,
                    title: _updateTitle == ''
                        ? titleController.text
                        : _updateTitle,
                    content: _updateContent == ''
                        ? contentController.text
                        : _updateContent,
                    color: currentColor.value == viewModel.pickerColor.value
                        ? widget.note!.color
                        : viewModel.pickerColor.value,
                    // color: widget.note!.color,
                    timestamp: DateFormat('yyyy/MM/dd HH:mm:ss').format(
                      DateTime.now(),
                    ),
                  ),
                ),
              );
              Future.delayed(const Duration(milliseconds: 500), () {
                showSnackbar(title: '성공했습니다', context: context);
              }).then((value) => Navigator.of(context).pop()).then(
                    (value) => noteViewModel.onEvent(
                      const NotesEvent.loadNotes(),
                    ),
                  );
            } else if (_formKey.currentState!.validate()) {
              viewModel.onEvent(
                AddEditNoteEvent.saveNote(
                  Note(
                    title: titleController.text,
                    content: contentController.text,
                    color: viewModel.pickerColor.value,
                    timestamp: DateFormat('yyyy/MM/dd HH:mm:ss').format(
                      DateTime.now(),
                    ),
                  ),
                ),
              );
              Future.delayed(const Duration(milliseconds: 500), () {
                showSnackbar(title: '성공했습니다', context: context);
              }).then((value) => Navigator.of(context).pop()).then(
                    (value) => noteViewModel.onEvent(
                      const NotesEvent.loadNotes(),
                    ),
                  );
            } else {
              Future.delayed(
                const Duration(
                  milliseconds: 500,
                ),
                () {
                  showSnackbar(title: '실패했습니다', context: context);
                },
              );
            }
          },
          child: const Icon(Icons.check),
        ),
        body: SafeArea(
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 200,
            ),
            padding: const EdgeInsets.all(16.0),
            color:
                widget.note != null && !(currentColor != viewModel.pickerColor)
                    ? Color(widget.note!.color)
                    : currentColor != viewModel.pickerColor
                        ? viewModel.pickerColor
                        : Colors.white,
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    viewModel.onEvent(
                      AddEditNoteEvent.changeColor(context, currentColor),
                    );
                  },
                  child: _bgColorCircle(
                    viewModel.pickerColor,
                    currentColor != viewModel.pickerColor,
                  ),
                ),
                _textField(
                  controller: titleController,
                  hintText: '타이틀',
                  onValueChanged: (value) {
                    widget.note != null
                        ? setState(() {
                            _updateTitle = value;
                            // _title = value;e
                          })
                        : null;
                  },
                  isTitle: true,
                ),
                _textField(
                  controller: contentController,
                  hintText: '내용',
                  onValueChanged: (value) {
                    widget.note != null
                        ? setState(() {
                            _updateContent = value;
                            // _content = value;
                          })
                        : null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bgColorCircle(
    Color color,
    bool selected,
  ) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      padding: const EdgeInsets.all(8),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: widget.note != null && !selected
            ? Color(widget.note!.color)
            : selected
                ? color
                : Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 6.0,
            spreadRadius: 1.0,
          )
        ],
      ),
    );
  }

  TextFormField _textField({
    required TextEditingController controller,
    required String hintText,
    required ValueChanged onValueChanged,
    bool isTitle = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: !isTitle ? null : 1,
      style: TextStyle(
        fontSize: isTitle ? 16.0 : 12.0,
        fontWeight: isTitle ? FontWeight.w500 : FontWeight.normal,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '$hintText을 입력해주세요',
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
      ),
      onChanged: onValueChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText을 다시 입력해주세요';
        }
      },
    );
  }
}
