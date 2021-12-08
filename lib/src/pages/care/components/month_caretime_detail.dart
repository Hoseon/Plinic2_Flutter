import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/care/care_diary_main_detail.dart';

class MonthCareTimeDetailPage extends StatelessWidget {
  MonthCareTimeDetailPage(
      {Key? key, this.month, this.chartValue, this.totalRank})
      : super(key: key);

  final String? month;
  final double? chartValue;
  final String? totalRank;

  final Map<String, double> dataMap = {
    'Flutter': 6,
    'React': 4,
    // 'Xamarin': 2,
    // 'Ionic': 2,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 41),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '$month 월 총 사용시간',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    // height: 1.63,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '최종 순위',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text('$totalRank위',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  SizedBox(height: 36),
                  Text(
                    '플라즈마 등급',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: spacing_xs),
                  InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        showModalBottomSheet(
                          enableDrag: true,
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          // barrierColor: Colors.transparent,
                          isScrollControlled: true,

                          context: context,
                          builder: (context) => buildSheet(),
                        );
                      },
                      child: Image.asset('assets/images/care/gold-icon.png'))
                  // Text(
                  //   '122위',
                  //   style: TextStyle(
                  //     fontFamily: 'NotoSansKR',
                  //     color: black,
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w400,
                  //     fontStyle: FontStyle.normal,
                  //   ),
                  // )
                ],
              ),
              Column(
                children: [
                  // Text(
                  //   '100',
                  //   style: TextStyle(
                  //     fontFamily: 'NotoSansKR',
                  //     color: grey_1,
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w400,
                  //     fontStyle: FontStyle.normal,
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          width: 190,
                          height: 190,
                          child: CircularPercentIndicator(
                            // fillColor: grey_3,
                            backgroundColor: grey_3,
                            radius: 170,
                            percent: 0.3,
                            animation: true,
                            animationDuration: 2000,
                            lineWidth: 19,
                            progressColor: primary,
                            curve: Curves.linear,
                            header: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '100',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: grey_1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                          // PieChart(
                          //   initialAngleInDegree: -90,
                          //   dataMap: dataMap,
                          //   chartType: ChartType.ring,
                          //   ringStrokeWidth: 20,
                          //   animationDuration: Duration(seconds: 1),
                          //   colorList: [primary, grey_3],
                          //   legendOptions: LegendOptions(
                          //     showLegends: false,
                          //   ),
                          //   chartValuesOptions:
                          //       ChartValuesOptions(showChartValues: false),
                          // ),
                          ),
                      Column(
                        children: [
                          Text(
                            '목표시간 100분',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('35분',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: black,
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Divider(),
      ],
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.back(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet() => makeDismissible(
          child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: spacing_xl, vertical: spacing_xxl2),
          child: ListView(
            controller: controller,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '플라즈마 사용 등급 기준',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(LineIcons.times))
                ],
              ),
              SizedBox(height: spacing_m),
              Divider(),
              SizedBox(height: spacing_m),
              Padding(
                padding: const EdgeInsets.only(right: 90),
                child: Text(
                    'Plinic에서는 플라즈마 사용시간에 따라 등급을 부여합니다. 등급은 전월 사용시간을 기준으로 매월 갱신되어 노출됩니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      height: 1.64,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: 21),
              Row(
                children: [
                  Image.asset('assets/images/care/vip-icon.png'),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VIP',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: spacing_xxs),
                      Text('전월 100분 이상 사용 시',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(height: 37),
              Row(
                children: [
                  Image.asset('assets/images/care/gold.png'),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GOLD',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: spacing_xxs),
                      Text(
                        '전월 50분 ~ 100분 미만 사용 시',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 37),
              Row(
                children: [
                  Image.asset('assets/images/care/premium-icon.png'),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PREMIUM',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: spacing_xxs),
                      Text(
                        '전월 20분 ~ 50분 미만 사용 시',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 37),
              Row(
                children: [
                  Image.asset('assets/images/care/famaily-icon.png'),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FAMAILY',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: spacing_xxs),
                      Text(
                        '전월 20분 미만 사용 시',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ));
}
