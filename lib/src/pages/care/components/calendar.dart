import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plinic2/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class CareCalendarPage extends StatelessWidget {
  CareCalendarPage({Key? key}) : super(key: key);
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.mediaQuery.size.width,
      height: 112,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: white),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color: Color(0x19000000),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              calendarFormat: _calendarFormat,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                weekendStyle: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              headerVisible: false,
              locale: 'ko-KR',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarStyle: CalendarStyle(
                todayDecoration:
                    BoxDecoration(color: primary, shape: BoxShape.circle),
                markerDecoration: BoxDecoration(color: Colors.red),
                // defaultDecoration: BoxDecoration(color: Colors.red),
                selectedDecoration: BoxDecoration(color: Colors.red),
              ),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (day.weekday == DateTime.sunday) {
                    final text = DateFormat.E().format(day);
                    return Center(
                      child: Text(
                        '일',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                    );
                  }

                  if (day.weekday == DateTime.saturday) {
                    final text = DateFormat.E().format(day);
                    return Center(
                      child: Text(
                        '토',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 64,
            height: 2,
            decoration: BoxDecoration(color: grey_2),
          )
        ],
      ),
    );
  }
}
