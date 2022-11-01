import 'package:departments/shared/constant/calendar/src/customization/calendar_style.dart';
import 'package:departments/shared/constant/calendar/src/customization/days_of_week_style.dart';
import 'package:departments/shared/constant/calendar/src/customization/header_style.dart';
import 'package:departments/shared/constant/calendar/src/shared/utils.dart';
import 'package:departments/shared/constant/calendar/src/table_calendar.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/custom%20events%20dialog/custom_events_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key, required this.date}) : super(key: key);
  final List<DateTime> date;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  late Map<DateTime, bool> events = {};

  Future t() async {
    return events;
  }

  bool event(DateTime date) {
    widget.date.forEach((e) {
      events[e] = true;
    });
    return events[date] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
      eventLoader: event,
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      startingDayOfWeek: StartingDayOfWeek.saturday,
      focusedDay: _focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2023),
      rowHeight: 45,
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: darkBlue, width: 2)),
        selectedTextStyle: Fonts.fBlack(size: 16, color: darkBlue),
        disabledTextStyle:
            Fonts.fBold(size: 16, color: darkBlue.withOpacity(0.5)),
        weekendTextStyle: Fonts.fBlack(size: 16, color: darkBlue),
        defaultTextStyle: Fonts.fBlack(size: 16, color: darkBlue),
        todayTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        todayDecoration:
            const BoxDecoration(color: darkBlue, shape: BoxShape.circle),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: darkBlue, fontWeight: FontWeight.w700),
        weekendStyle: TextStyle(color: darkBlue, fontWeight: FontWeight.w700),
      ),
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          rightChevronIcon: Transform.rotate(
              angle: math.pi,
              child: const Icon(
                MyIcons.angle_left,
                color: darkBlue,
                size: 15,
              )),
          leftChevronIcon: const Icon(
            MyIcons.angle_left,
            color: darkBlue,
            size: 15,
          ),
          titleTextStyle:
              Fonts.fBold(size: size.width / 18.5, color: darkBlue)),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        print(DateFormat.yMd().format(_selectedDay));
        showDialog(
            context: context,
            builder: (context) => EventsDialog(
                  date:
                      '${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}',
                ));
      },
    );
  }
}
