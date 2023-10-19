import 'package:flutter/material.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Function? onDeleteTap;
  final SlidableActionCallback? onDeletePressed;
  final SlidableActionCallback? onRestorePressed;

  const NoteItem({
    super.key,
    required this.note,
    this.onDeleteTap,
    this.onDeletePressed,
    this.onRestorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return sliderAction(
      onDeletePressed: onDeletePressed,
      onRestorePressed: onRestorePressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(note.color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  note.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                note.timestamp.toString(),
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Slidable sliderAction({
    required Widget child,
    required SlidableActionCallback? onDeletePressed,
    required SlidableActionCallback? onRestorePressed,
  }) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            flex: 1,
            padding: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            onPressed: onDeletePressed,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      // endActionPane: ActionPane(
      //   motion: const DrawerMotion(),
      //   children: [
      //     SlidableAction(
      //       flex: 1,
      //       padding: const EdgeInsets.all(8),
      //       borderRadius: BorderRadius.circular(8),
      //       onPressed: onRestorePressed,
      //       backgroundColor: const Color(0xFF7BC043),
      //       foregroundColor: Colors.white,
      //       icon: Icons.archive,
      //       label: 'Restore',
      //     ),
      //   ],
      // ),
      child: child,
    );
  }
}
