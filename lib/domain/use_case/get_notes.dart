import 'package:flutter_note/core/util/note_order.dart';
import 'package:flutter_note/core/util/order_type.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';

class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call(NoteOrder noteOrder) async {
    List<Note> notes = await repository.getNotes();
    noteOrder.when(
      title: (OrderType orderType) {
        orderType.when(
          desc: () {
            notes.sort((a, b) => -a.title.compareTo(b.title));
          },
          asc: () {
            notes.sort((a, b) => a.title.compareTo(b.title));
          },
        );
      },
      time: (OrderType orderType) {
        orderType.when(
          desc: () {
            notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
          },
          asc: () {
            notes.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          },
        );
      },
      color: (OrderType orderType) {
        orderType.when(
          desc: () {
            notes.sort((a, b) => -a.color.compareTo(b.color));
          },
          asc: () {
            notes.sort((a, b) => a.color.compareTo(b.color));
          },
        );
      },
    );
    return notes;
  }
}
