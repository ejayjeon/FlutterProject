import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TableCalendar(
            firstDay: DateTime(2000),
            focusedDay: DateTime.now(),
            lastDay: DateTime(2030),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(fontSize: 16.0),
            ),
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(
                () {
                  this.selectedDay = selectedDay;
                },
              );
            },
            selectedDayPredicate: (DateTime date) {
              // 어떤 날짜도 선택하지 않은 경우
              if (selectedDay == null) {
                return false;
              }
              return date.year == selectedDay!.year &&
                  date.month == selectedDay!.month &&
                  date.day == selectedDay!.day;
            },
          ),
        ),
      ),
    );
  }
}
