import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/restclient/DeviceCountClient.dart';
import 'package:table_calendar/table_calendar.dart';

class CareCalendarPage extends StatelessWidget {
  CareCalendarPage({Key? key}) : super(key: key);
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  Map<DateTime, List>? _events;
  Dio dio = Dio();
  List<DeviceCountModel>? deviceCountModel;
  var map2 = {};

  @override
  Widget build(BuildContext context) {
    _events = {
      // DateTime.utc(2022, 2, 2): ['Event 1'],
      // DateTime.utc(2022, 2, 4): ['Event 2'],
      // DateTime.utc(2022, 2, 5): ['Event 3'],
      // DateTime.utc(2022, 2, 8): ['Event 4'],
      // DateTime.utc(2022, 2, 11): ['Event 5'],
      // DateTime.utc(2022, 2, 12): ['Event 6'],
      // DateTime.utc(2022, 2, 13): ['Event 6'],
      // DateTime.utc(2022, 2, 14): ['Event 6'],
    };

    var client = DeviceCountClient(dio);
    return Obx(
      () => ProfileController.to.myProfile.value.uid != null
          ? FutureBuilder(
              future: client.getCalendarCountData(
                  ProfileController.to.myProfile.value.uid),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(color: primary));
                }
                if (snapshot.hasData) {
                  deviceCountModel = snapshot.data as List<DeviceCountModel>;

                  deviceCountModel!.forEach((value) {
                    map2[DateTime.utc(
                            value.id!.year, value.id!.month, value.id!.day)] =
                        value.count;
                  });
                  // print(map2);
                  return buildCalendar();
                }
                return Center(child: CircularProgressIndicator(color: primary));
              },
            )
          : SizedBox(),
    );
  }

  Container buildCalendar() {
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
                defaultTextStyle: TextStyle(color: grey_2),
                weekendTextStyle: TextStyle(color: grey_2),
                todayTextStyle: TextStyle(color: primary, fontSize: 18),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(color: Colors.red),
                // defaultDecoration: BoxDecoration(color: Colors.red),
                selectedDecoration: BoxDecoration(color: Colors.red),
              ),
              eventLoader: (day) {
                final children = <Widget>[];
                map2.forEach((key, value) {
                  //이벤트 날짜와 달력의 날짜가 같으면 마커를 표기 한다.
                  if (key == day) {
                    children.add(Container(
                      width: 10,
                      height: 10,
                      color: Colors.red,
                    ));
                  }
                });
                return children;
              },
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (events.isNotEmpty) {
                    // print(DateFormat('d').format(day));
                    return Center(
                      child: Container(
                        width: 37,
                        height: 37,
                        decoration: BoxDecoration(
                          color: grey_2,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Text(
                          DateFormat('d').format(day),
                          style: TextStyle(
                            color: white,
                          ),
                        )),
                      ),
                    );
                  }
                  // print('이벤트 있나? $events');
                },
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
