import 'package:basics_project_flutter/ui_TooDooo/widgets/task_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
        viewType: ViewType.DAILY,
        toggleViewType: true,
        headerMonthElevation: 10,
        headerMonthShadowColor: Colors.transparent,
        headerMonthBackColor: Colors.transparent,
      ),
      dayOptions: DayOptions(
          compactMode: true,
          weekDaySelectedColor: const Color(0xff3AC3E2),
          disableDaysBeforeNow: true),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: const Color(0xff3AC3E2),
          headerTextColor: Colors.black),
      onChangeDateTime: (datetime) {
        print(datetime.getDate());
      },
    ),
        Expanded(child: ListView.builder(itemBuilder: (context,index)=> TaskesTab(),itemCount: 20,)),
      ],
    );
  }
}
