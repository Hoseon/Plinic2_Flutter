import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/ble_connect/components/timer_text_formatter.dart';
import 'package:plinic2/src/restclient/DeviceCountClient.dart';
import 'package:plinic2/src/restclient/DeviceLogClient.dart';

class MonthlyPlinicPage extends StatelessWidget {
  MonthlyPlinicPage({Key? key}) : super(key: key);
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    var client = DeviceLogClient(dio);
    var monthCountclient = DeviceCountClient(dio);
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text('케어 기록',
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '플리닉으로 피부 습관 만든지',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              buildAllCount(monthCountclient),
              Text(
                '째 날이예요',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                '👋',
                style: TextStyle(height: 1.23),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_m),
            width: Get.mediaQuery.size.width,
            height: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: grey_3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '이달의 사용시간',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                getMonthTime(client)
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_m),
            width: Get.mediaQuery.size.width,
            height: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: grey_3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '이달의 사용일',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                buildMonthCount2(monthCountclient),
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xs),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
        //   child: Container(
        //     padding: EdgeInsets.symmetric(horizontal: spacing_m),
        //     width: Get.mediaQuery.size.width,
        //     height: 51,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(Radius.circular(4)),
        //       color: grey_3,
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(
        //           '누적 사용일',
        //           style: TextStyle(
        //             fontFamily: 'NotoSans',
        //             color: grey_1,
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             fontStyle: FontStyle.normal,
        //           ),
        //         ),
        //         Text('케어를 시작하세요',
        //             style: TextStyle(
        //               fontFamily: 'NotoSans',
        //               color: black,
        //               fontSize: 14,
        //               fontWeight: FontWeight.w700,
        //               fontStyle: FontStyle.normal,
        //             ))
        //       ],
        //     ),
        //   ),
        // ),
        SizedBox(height: 40),
      ],
    );
  }

  Obx buildAllCount(DeviceCountClient monthCountclient) {
    return Obx(() => ProfileController.to.myProfile.value.uid != null
        ? FutureBuilder(
            future: monthCountclient.getAllCount(
                ProfileController.to.myProfile.value.uid.toString()),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var monthCountData = snapshot.data as List<AllCountResponse>;
                if (monthCountData.isNotEmpty) {
                  return Text(
                    ' ${monthCountData[0].myAllCount!.toInt()}일',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  );
                } else {
                  return Text(
                    ' 00일',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  );
                }
              }
              return SizedBox();
            },
          )
        : SizedBox());
  }

  Obx buildMonthCount(DeviceCountClient monthCountclient) {
    return Obx(() => ProfileController.to.myProfile.value.uid != null
        ? FutureBuilder(
            future: monthCountclient.getMonthCount(
                ProfileController.to.myProfile.value.uid.toString()),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var monthCountData = snapshot.data as List<MonthCountResponse>;
                if (monthCountData.isNotEmpty) {
                  return Text(
                    ' ${monthCountData[0].myMonthCount!.toInt()}일',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  );
                } else {
                  return Text(
                    ' 00일',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  );
                }
              }
              return SizedBox();
            },
          )
        : SizedBox());
  }

  Obx buildMonthCount2(DeviceCountClient monthCountclient) {
    return Obx(() => ProfileController.to.myProfile.value.uid != null
        ? FutureBuilder(
            future: monthCountclient.getMonthCount(
                ProfileController.to.myProfile.value.uid.toString()),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var monthCountData = snapshot.data as List<MonthCountResponse>;
                if (monthCountData.isNotEmpty) {
                  return Text(
                    ' ${monthCountData[0].myMonthCount!.toInt()}일',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  );
                } else {
                  return Text('오늘부터 도전!',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ));
                }
              }
              return SizedBox();
            },
          )
        : SizedBox());
  }

  Obx getMonthTime(DeviceLogClient client) {
    return Obx(
      () => ProfileController.to.myProfile.value.uid != null
          ? FutureBuilder(
              future: client.getMonthTime(
                  ProfileController.to.myProfile.value.uid.toString()),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var monthData = (snapshot.data as List<MonthTimeResponse>);
                  if (monthData.isNotEmpty) {
                    //이달의 시간 구해오기
                    return Text(
                        '${TimerTextFormatter.hourFormat(monthData[0].monthTime!.toInt())}',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ));
                  } else {
                    return Text('00 : 00 : 00',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ));
                  }
                }
                return SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        color: primary, strokeWidth: 2));
              },
            )
          : SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: primary, strokeWidth: 2)),
    );
  }
}
