import 'package:flutter/material.dart';
import 'package:flutter_note/core/util/note_order.dart';
import 'package:flutter_note/core/util/order_type.dart';
import 'package:flutter_note/presentation/view_model/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note/presentation/view_model/main_note/main_notes_view_model.dart';
import 'package:provider/provider.dart';

class OrderSection extends StatelessWidget {
  final Function(NoteOrder noteOrder) onOrderChanged;
  final NoteOrder noteOder;
  const OrderSection({
    super.key,
    required this.onOrderChanged,
    required this.noteOder,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Radio<NoteOrder>(
                  toggleable: true,
                  value: NoteOrder.time(noteOder.orderType),
                  groupValue: noteOder,
                  onChanged: (NoteOrder? value) {
                    onOrderChanged(NoteOrder.time(noteOder.orderType));
                  },
                ),
                Text('시간별'),
              ],
            ),
            Row(
              children: [
                Radio<NoteOrder>(
                  toggleable: true,
                  value: NoteOrder.title(noteOder.orderType),
                  groupValue: noteOder,
                  onChanged: (NoteOrder? value) {
                    onOrderChanged(NoteOrder.title(noteOder.orderType));
                  },
                ),
                Text('제목별'),
              ],
            ),
            Row(
              children: [
                Radio<NoteOrder>(
                  toggleable: true,
                  value: NoteOrder.color(noteOder.orderType),
                  groupValue: noteOder,
                  onChanged: (NoteOrder? value) {
                    onOrderChanged(NoteOrder.color(noteOder.orderType));
                  },
                ),
                Text('색상별'),
              ],
            ),
          ],
        ),

        // orderType
        Row(
          children: [
            Row(
              children: [
                Radio<OrderType>(
                  toggleable: true,
                  value: const OrderType.asc(),
                  groupValue: noteOder.orderType,
                  onChanged: (OrderType? value) {
                    onOrderChanged(noteOder.copyWith(
                      orderType: const OrderType.asc(),
                    ));
                  },
                ),
                Text('오름차순'),
              ],
            ),
            Row(
              children: [
                Radio<OrderType>(
                  toggleable: true,
                  value: const OrderType.desc(),
                  groupValue: noteOder.orderType,
                  onChanged: (OrderType? value) {
                    onOrderChanged(noteOder.copyWith(
                      orderType: const OrderType.desc(),
                    ));
                  },
                ),
                Text('내림차순'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
