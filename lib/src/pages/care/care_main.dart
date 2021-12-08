import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/tabs_controller.dart';
import 'package:plinic2/src/pages/alarm/alarm.dart';
import 'package:plinic2/src/pages/care/components/calendar.dart';
import 'package:plinic2/src/pages/care/components/calendar_month.dart';
import 'package:plinic2/src/pages/care/components/care_event.dart';
import 'package:plinic2/src/pages/care/components/daily_care.dart';
import 'package:plinic2/src/pages/care/components/month_caretime.dart';
import 'package:plinic2/src/pages/care/components/month_ranking.dart';
import 'package:plinic2/src/pages/care/components/point_baro.dart';
import 'package:plinic2/src/pages/my/my_test.dart';
import 'package:plinic2/src/pages/plinic_fab.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CareMainPage extends StatelessWidget {
  CareMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(
            '케어',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Get.to(AlarmPage(), transition: Transition.native);
                    },
                    child: Icon(LineIcons.bell, size: 28, color: black)),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    Get.to(MyTestPage(), transition: Transition.native);
                  },
                  child: Icon(LineIcons.userCircleAlt, size: 28, color: black),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: white,
      body: SlidingUpPanel(
        slideDirection: SlideDirection.DOWN,
        collapsed: CareCalendarPage(),
        isDraggable: true,
        minHeight: 120,
        maxHeight: 370,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        panel: CareCalendarMonthPage(),
        body: careMain(context),
      ),
      // careMain_Loading(),
      floatingActionButton: PlinicFaB(),
    );
  }

  Widget careMain(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 112),
          // CareCalendarPage(),
          SizedBox(height: 48),
          MonthCareTimePage(),
          CareEventPage(),
          DailyCarePage(),
          MonthRankingPage(),
          PointBaroPage(),
          SizedBox(height: 180),
        ],
      ),
    );
  }

  Widget careMain_Loading() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: Get.mediaQuery.size.width,
            height: 112,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: white),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
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
                SizedBox(height: 17),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                    ],
                  ),
                ),
                SizedBox(height: spacing_s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCalendarshimmerCircle(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                      _buildCalendarshimmer(),
                    ],
                  ),
                ),
                SizedBox(height: 29),
                Container(
                  width: 64,
                  height: 2,
                  decoration: BoxDecoration(color: grey_2),
                )
              ],
            ),
          ),
          SizedBox(height: 49),
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 2),
            baseColor: grey_3,
            highlightColor: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.only(left: spacing_xl, right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 136,
                    height: 24,
                    color: grey_3,
                  ),
                  Container(
                    width: 43,
                    height: 24,
                    color: grey_3,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 14),
          Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 2),
            baseColor: grey_3,
            highlightColor: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.only(left: 230, right: 102),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 43,
                    height: 16,
                    color: grey_3,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xxs),
          Padding(
            padding:
                const EdgeInsets.only(left: spacing_xl, right: spacing_xxl2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(40, 20, grey_2),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(72, 20, grey_3),
                    SizedBox(height: 26),
                    _buildshimmer(40, 20, grey_2),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(72, 20, grey_3),
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Shimmer.fromColors(
                          direction: ShimmerDirection.ltr,
                          period: Duration(seconds: 2),
                          baseColor: grey_3,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            width: 188,
                            height: 188,
                            decoration: BoxDecoration(
                                color: grey_3, shape: BoxShape.circle),
                          ),
                        ),
                        Container(
                          width: 148,
                          height: 148,
                          decoration: BoxDecoration(
                              color: white, shape: BoxShape.circle),
                        ),
                        Column(
                          children: [
                            _buildshimmer(94, 20, grey_3),
                            SizedBox(height: 6),
                            _buildshimmer(94, 44, grey_2),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 68),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(72, 20, grey_2),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(181, 20, grey_2),
                    SizedBox(height: spacing_xs),
                    _buildshimmer(206, 20, grey_3),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(206, 20, grey_3),
                  ],
                ),
                SizedBox(width: Get.mediaQuery.size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 99,
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey_3),
                      ),
                      child: Text(
                        '관리하러가기',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 49),
          Divider(thickness: 15, color: grey_3),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(181, 20, grey_2),
          ),
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(217, 16, grey_3),
          ),
          SizedBox(height: spacing_xxs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(217, 16, grey_3),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.only(left: 75, right: 220),
            child: _buildshimmer(80, 16, grey_3),
          ),
          SizedBox(height: spacing_m),
          Container(
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: _buildshimmer(
                      Get.mediaQuery.size.width * 0.87, 6, grey_3),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 2),
                        baseColor: grey_3,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: grey_3, shape: BoxShape.circle),
                        ),
                      ),
                      Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 2),
                        baseColor: grey_3,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: grey_3, shape: BoxShape.circle),
                        ),
                      ),
                      Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 2),
                        baseColor: grey_3,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: grey_3, shape: BoxShape.circle),
                        ),
                      ),
                      Shimmer.fromColors(
                        direction: ShimmerDirection.ltr,
                        period: Duration(seconds: 2),
                        baseColor: grey_3,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: grey_3, shape: BoxShape.circle),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 80,
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/location.svg'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildshimmer(28, 16, grey_3),
              ],
            ),
          ),
          SizedBox(height: spacing_s),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildshimmer(200, 18, grey_3),
            ],
          ),
          SizedBox(height: spacing_xxl2),
          buildShimmer2(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Divider(
              color: grey_2,
            ),
          ),
          buildShimmer2(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Divider(
              color: grey_2,
            ),
          ),
          buildShimmer2(),
          SizedBox(height: 86),
          Container(
            width: Get.mediaQuery.size.width,
            height: 310,
            decoration: BoxDecoration(color: grey_3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildshimmer(181, 20, grey_2),
                          SizedBox(height: spacing_s),
                          _buildshimmer(217, 20, grey_2),
                        ],
                      ),
                      _buildshimmer(56, 48, grey_2),
                    ],
                  ),
                  SizedBox(height: spacing_xl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.mediaQuery.size.width * 0.427,
                        height: Get.mediaQuery.size.width * 0.427,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x0c000000),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0)
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: spacing_xl),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacing_m),
                              child: Row(
                                children: [_buildshimmer(85, 20, grey_3)],
                              ),
                            ),
                            SizedBox(height: 22),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacing_m),
                              child: Row(
                                children: [_buildshimmer(55, 20, grey_2)],
                              ),
                            ),
                            SizedBox(height: spacing_m),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacing_m),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [_buildshimmer(62, 28, grey_2)],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: spacing_xs),
                      Container(
                        width: Get.mediaQuery.size.width * 0.427,
                        height: Get.mediaQuery.size.width * 0.427,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x0c000000),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0)
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: spacing_xl),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacing_m),
                              child: Row(
                                children: [_buildshimmer(85, 20, grey_3)],
                              ),
                            ),
                            SizedBox(height: 22),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacing_m),
                              child: Row(
                                children: [_buildshimmer(55, 20, grey_2)],
                              ),
                            ),
                            SizedBox(height: spacing_m),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacing_m),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [_buildshimmer(62, 28, grey_2)],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 46),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(112, 20, grey_2),
          ),
          SizedBox(height: spacing_xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.mediaQuery.size.width * 0.427,
                height: Get.mediaQuery.size.width * 0.427,
                decoration: BoxDecoration(
                  border: Border.all(color: grey_2),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x0c000000),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0),
                    BoxShadow(
                        color: Color(0x0c000000),
                        offset: Offset(4, 0),
                        blurRadius: 4,
                        spreadRadius: 0)
                  ],
                  color: white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: spacing_s),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_m),
                      child: Row(
                        children: [
                          _buildshimmer(72, 20, grey_3),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_xxl),
                    Padding(
                      padding: const EdgeInsets.only(left: spacing_m),
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            period: Duration(seconds: 2),
                            baseColor: grey_3,
                            highlightColor: Colors.grey.shade300,
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  color: grey_3, shape: BoxShape.circle),
                            ),
                          ),
                          SizedBox(width: spacing_m),
                          Column(
                            children: [
                              _buildshimmer(72, 20, grey_2),
                              SizedBox(height: spacing_xxs),
                              _buildshimmer(72, 20, grey_2),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 23),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildshimmer(48, 20, grey_2),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: spacing_xs),
              Container(
                width: Get.mediaQuery.size.width * 0.427,
                height: Get.mediaQuery.size.width * 0.427,
                decoration: BoxDecoration(
                  border: Border.all(color: grey_2),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x0c000000),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0),
                    BoxShadow(
                        color: Color(0x0c000000),
                        offset: Offset(4, 0),
                        blurRadius: 4,
                        spreadRadius: 0)
                  ],
                  color: white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: spacing_s),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_m),
                      child: Row(
                        children: [
                          _buildshimmer(72, 20, grey_3),
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_xxl),
                    Padding(
                      padding: const EdgeInsets.only(left: spacing_m),
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            period: Duration(seconds: 2),
                            baseColor: grey_3,
                            highlightColor: Colors.grey.shade300,
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  color: grey_3, shape: BoxShape.circle),
                            ),
                          ),
                          SizedBox(width: spacing_m),
                          Column(
                            children: [
                              _buildshimmer(72, 20, grey_2),
                              SizedBox(height: spacing_xxs),
                              _buildshimmer(72, 20, grey_2),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 23),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildshimmer(48, 20, grey_2),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxl),
            child: Divider(),
          ),
          SizedBox(height: 56),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(112, 20, grey_2),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  period: Duration(seconds: 2),
                  baseColor: grey_3,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        color: grey_3,
                        shape: BoxShape.circle,
                        border: Border.all(color: grey_2)),
                  ),
                ),
                SizedBox(width: spacing_m),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(52, 20, grey_2),
                    SizedBox(height: spacing_xxs),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildshimmer(200, 20, grey_3),
                        SizedBox(width: Get.mediaQuery.size.width * 0.05),
                        Icon(LineIcons.angleRight, color: grey_2)
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(200, 20, grey_3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxl),
            child: Divider(),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  period: Duration(seconds: 2),
                  baseColor: grey_3,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        color: grey_3,
                        shape: BoxShape.circle,
                        border: Border.all(color: grey_2)),
                  ),
                ),
                SizedBox(width: spacing_m),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(52, 20, grey_2),
                    SizedBox(height: spacing_xxs),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildshimmer(200, 20, grey_3),
                        SizedBox(width: Get.mediaQuery.size.width * 0.05),
                        Icon(LineIcons.angleRight, color: grey_2)
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(200, 20, grey_3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxl),
            child: Divider(),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  period: Duration(seconds: 2),
                  baseColor: grey_3,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        color: grey_3,
                        shape: BoxShape.circle,
                        border: Border.all(color: grey_2)),
                  ),
                ),
                SizedBox(width: spacing_m),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(52, 20, grey_2),
                    SizedBox(height: spacing_xxs),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildshimmer(200, 20, grey_3),
                        SizedBox(width: Get.mediaQuery.size.width * 0.05),
                        Icon(LineIcons.angleRight, color: grey_2)
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(200, 20, grey_3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxl),
            child: Divider(),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  period: Duration(seconds: 2),
                  baseColor: grey_3,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        color: grey_3,
                        shape: BoxShape.circle,
                        border: Border.all(color: grey_2)),
                  ),
                ),
                SizedBox(width: spacing_m),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(52, 20, grey_2),
                    SizedBox(height: spacing_xxs),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildshimmer(200, 20, grey_3),
                        SizedBox(width: Get.mediaQuery.size.width * 0.05),
                        Icon(LineIcons.angleRight, color: grey_2)
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(200, 20, grey_3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxl),
            child: Divider(),
          ),
          SizedBox(height: 23),
        ],
      ),
    );
  }

  Shimmer _buildshimmer(double width, double height, color) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
      baseColor: color,
      highlightColor: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width,
            height: height,
            color: grey_3,
          ),
        ],
      ),
    );
  }

  Shimmer _buildCalendarshimmer() {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
      baseColor: grey_3,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: 22,
        height: 22,
        color: grey_3,
      ),
    );
  }

  Shimmer _buildCalendarshimmerCircle() {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
      baseColor: grey_3,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(color: grey_3, shape: BoxShape.circle),
      ),
    );
  }

  Widget buildShimmer2() {
    return Column(
      children: [
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.only(left: spacing_s, right: 36),
          child: Row(
            children: [
              _buildshimmer(72, 72, grey_3),
              SizedBox(width: spacing_xs),
              Expanded(
                child: Column(
                  children: [
                    _buildshimmer(80, 16, grey_2),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(80, 16, grey_3),
                  ],
                ),
              ),
              Container(
                // width: 100,
                // height: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildshimmer(19, 16, grey_2),
                        SizedBox(height: spacing_xxs),
                        _buildshimmer(52, 16, grey_3),
                      ],
                    ),
                    Positioned(
                      right: 18,
                      // bottom: 10,
                      child: Image.asset(
                        'assets/images/pass-stamp.png',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xs),
      ],
    );
  }

  Future<bool> _onwillPop() async {
    return false;
  }
}
