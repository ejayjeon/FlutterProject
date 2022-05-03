import 'package:dayxday/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:dayxday/cubit/app_cubit.dart';
import 'package:intl/intl.dart';

class TaskItem extends StatelessWidget {
  Map? tasks;

  TaskItem({this.tasks});
  final SlidableController slidableController = SlidableController();
  @override
  Widget build(BuildContext context) {
    String date = tasks!['date'];
    String time = tasks!['time'];
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3),
      child: Slidable(
        key: Key(tasks!['title']),
        dismissal: SlidableDismissal(
          dismissThresholds: <SlideActionType, double>{
            SlideActionType.secondary: 1.0
          },
          child: SlidableDrawerDismissal(),
          onDismissed: (actionType) {
            AppCubit.get(context).deleteFromDatabase(tasks!['id']);
          },
        ),
        controller: slidableController,
        enabled: true,
        actionExtentRatio: 0.2,
        movementDuration: Duration(microseconds: 10),
        actionPane: SlidableScrollActionPane(),
        actions: [
          IconSlideAction(
            closeOnTap: true,
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              AppCubit.get(context).deleteFromDatabase(tasks!['id']);
            },
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            child: IconSlideAction(
              closeOnTap: true,
              caption: 'Archive',
              color: veryPeri,
              icon: Icons.archive,
              onTap: () {
                AppCubit.get(context).updateDatabase('archived', tasks!['id']);
              },
            ),
          ),
        ],
        secondaryActions: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: tasks!['status'] == 'archived' || tasks!['status'] == 'done'
                ? IconSlideAction(
                    closeOnTap: true,
                    caption: 'Back',
                    color: Colors.grey,
                    icon: Icons.arrow_back_ios_new,
                    onTap: () {
                      AppCubit.get(context).updateDatabase('New', tasks!['id']);
                    },
                  )
                : IconSlideAction(
                    closeOnTap: true,
                    caption: 'Done',
                    color: Colors.green,
                    icon: Icons.check_circle,
                    onTap: () {
                      AppCubit.get(context)
                          .updateDatabase('done', tasks!['id']);
                    },
                  ),
          ),
        ],
        //  Todo List
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: bgColorWhite),
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 2, right: 10),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$date 까지 완료',
                              style: TextStyle(
                                  color: veryPeri,
                                  fontSize: 10,
                                  fontFamily: 'NotoSans'),
                            ),
                            SizedBox(height: 10),
                            Text(
                              tasks!['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  decoration: tasks!['status'] == 'done'
                                      ? TextDecoration.lineThrough
                                      : null,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoSans'),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
