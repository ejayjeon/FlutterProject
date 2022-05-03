import 'package:dayxday/components/calendar.dart';
import 'package:dayxday/components/schedule_bottomsheet.dart';
import 'package:dayxday/components/schedule_box.dart';
import 'package:dayxday/components/today_banner.dart';
import 'package:dayxday/database/drift_db.dart';
import 'package:dayxday/model/scheduleWithCate.dart';
import 'package:dayxday/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CalendarScreen extends StatefulWidget {
  // final int itemCount;
  // final int startTime;
  // final int endTime;
  // final String content;
  // final Color color;
  // final SlidableController slidableController;
  const CalendarScreen(
      {
      //   required this.itemCount,
      // required this.startTime,
      // required this.endTime,
      // required this.content,
      // required this.color,
      // required this.slidableController,
      Key? key})
      : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // UTC 기준이 아니라 현지시간 기준
  DateTime selectedDay =
      // null 일 경우를 아예 배제
      DateTime.utc(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: onDaySelected,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              //scheduleCount: 3,
            ),
            const SizedBox(
              height: 8.0,
            ),
            _ScheduledList(
                selectedDate: selectedDay,
                startTime: 11,
                endTime: 14,
                content: 'content',
                itemCount: 1,
                color: veryperi,
                category: 'cinema'),
          ],
        ),
      ),
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          // 화면 전체를 차지하게
          isScrollControlled: true,
          builder: (_) {
            return ScheduleBottomSheet(
              selectedDate: selectedDay,
            );
          },
        );
      },
      backgroundColor: veryperi,
      child: Icon(Icons.add),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(
      () {
        // UTC 기준으로 날짜를 선택
        this.selectedDay = selectedDay;
        this.focusedDay = selectedDay;
      },
    );
  }
}

class _ScheduledList extends StatelessWidget {
  final DateTime selectedDate;
  final int itemCount;
  final int startTime;
  final int endTime;
  final String content;
  final Color color;
  final String category;
  const _ScheduledList({
    required this.selectedDate,
    required this.itemCount,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: StreamBuilder<List<ScheduleWithCate>>(
          stream: GetIt.I<LocalDb>().watchSchedules(selectedDate),
          builder: (context, snapshot) {
            // 쿼리 자체에서 where 필터를 진행했기 때문에 더 이상 할 필요가 없다
            // List<Schedule> schedules = [];
            // if (snapshot.hasData) {
            //   schedules = snapshot.data!
            //       .where((e) => e.date.toUtc() == selectedDate)
            //       .toList();
            //   print(schedules);
            // }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  '스케줄이 없습니다',
                  style: TextStyle(
                    color: veryperi,
                  ),
                ),
              );
            }
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 8.0);
              },
              itemBuilder: (context, index) {
                final scheduleWithCate = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    // Update : 카드를 눌러서 bottomSheet 보여줌
                    // 어떤 id를 가진 bottomSheet 인지 알 필요가 있음
                    showModalBottomSheet(
                      context: context,
                      // 화면 전체를 차지하게
                      isScrollControlled: true,
                      builder: (_) {
                        return ScheduleBottomSheet(
                          selectedDate: selectedDate,
                          sheduleId: scheduleWithCate.schedule.id,
                        );
                      },
                    );
                  },
                  child: Dismissible(
                    // 스와이프 액션
                    key: ObjectKey(scheduleWithCate.schedule.id),
                    confirmDismiss: (DismissDirection direction) async {
                      switch (direction) {
                        case DismissDirection.endToStart:
                          return await _showConfirmationDialog(
                                  context, 'Archive', selectedDate) ==
                              true;
                        case DismissDirection.startToEnd:
                          return await _showConfirmationDialog(
                                  context, 'Delete', selectedDate) ==
                              true;
                        case DismissDirection.horizontal:
                        case DismissDirection.vertical:
                        case DismissDirection.up:
                        case DismissDirection.down:
                          assert(false);
                      }
                      return false;
                    },
                    onDismissed: (DismissDirection direction) {
                      GetIt.I<LocalDb>()
                          .removeSchedule(scheduleWithCate.schedule.id);
                    },
                    direction: DismissDirection.endToStart,
                    child: ScheduleBox(
                      startTime: scheduleWithCate.schedule.startTime,
                      endTime: scheduleWithCate.schedule.endTime,
                      content: scheduleWithCate.schedule.content,
                      color: color,
                      category:
                          scheduleWithCate.categoryName.category.toString(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void onPressed() {}

  Future<bool?> _showConfirmationDialog(
      BuildContext context, String action, DateTime selectedDate) {
    final textStyle = TextStyle(
      color: veryperi,
      fontSize: 13.0,
    );
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${selectedDate.day}일의 스케줄을 삭제하시겠습니까?', style: textStyle),
          actions: <Widget>[
            OutlinedButton(
              child: Text(
                'Yes',
                style: textStyle,
              ),
              onPressed: () {
                Navigator.pop(context, true); // showDialog() returns true
              },
            ),
            OutlinedButton(
              child: Text('No', style: textStyle),
              onPressed: () {
                Navigator.pop(context, false); // showDialog() returns false
              },
            ),
          ],
        );
      },
    );
  }
}
