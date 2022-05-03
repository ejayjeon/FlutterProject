import 'package:dayxday/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  const Calendar(
      {required this.selectedDay,
      required this.focusedDay,
      required this.onDaySelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TableCalendar(
        locale: 'ko_KR',
        firstDay: DateTime(2000),
        focusedDay: focusedDay,
        lastDay: DateTime(2030),
        headerStyle: const HeaderStyle(
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: veryperi,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: veryperi,
          ),
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontSize: 16.0),
        ),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: false, // 오늘 날짜 표시
          outsideDecoration: defaultBoxDeco(
              Colors.transparent), // 설정해주지 않으면 원형이 기본인 이전 달로 이동할 경우 에러 발생
          defaultDecoration: defaultBoxDeco(paleGrey),
          weekendDecoration: defaultBoxDeco(paleGrey),
          selectedDecoration: defaultBoxDeco(veryperi).copyWith(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: veryperi, width: 2.0),
          ),
          weekendTextStyle: defaultTextDeco(veryperi),
          selectedTextStyle:
              defaultTextDeco(fontColor).copyWith(fontWeight: FontWeight.bold),
        ),
        onDaySelected: onDaySelected,
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
    );
  }

  BoxDecoration defaultBoxDeco(c) {
    return BoxDecoration(
      color: c,
      borderRadius: BorderRadius.circular(6.0),
    );
  }

  TextStyle defaultTextDeco(t) {
    return TextStyle(
      color: t,
    );
  }
}
