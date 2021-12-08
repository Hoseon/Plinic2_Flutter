import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/care/care_diary_main_detail.dart';
import 'package:plinic2/src/pages/care/device_ranking.dart';

class MonthCareTimePage extends StatelessWidget {
  MonthCareTimePage({Key? key}) : super(key: key);

  Map<String, double> dataMap = {
    'Flutter': 6,
    'React': 4,
    // 'Xamarin': 2,
    // 'Ionic': 2,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '이달의 총 케어시간',
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
              InkWell(
                onTap: () {
                  Get.to(CareDiaryMainDetailPage(),
                      transition: Transition.native);
                },
                child: Row(
                  children: [
                    Text(
                      '더보기',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 14,
                        // height: 1.63,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Icon(LineIcons.angleRight, color: grey_2, size: 14),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xxl2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '오늘',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    '00분 00초',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: spacing_xl),
                  InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      Get.to(DeviceRanking(), transition: Transition.native);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '나의 순위',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          '122위',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // // Text(
                  // //   '100',
                  // //   style: TextStyle(
                  // //     fontFamily: 'NotoSansKR',
                  // //     color: grey_1,
                  // //     fontSize: 12,
                  // //     fontWeight: FontWeight.w400,
                  // //     fontStyle: FontStyle.normal,
                  // //   ),
                  // // ),
                  // SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          width: 188,
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
                          //   animationDuration: Duration(milliseconds: 3000),
                          //   colorList: [primary, grey_3],
                          //   legendOptions: LegendOptions(
                          //     showLegends: false,
                          //   ),
                          //   chartValuesOptions: ChartValuesOptions(
                          //     showChartValues: false,
                          //   ),
                          // ),
                          ),
                      Column(
                        children: [
                          SizedBox(height: spacing_xl),
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
        SizedBox(height: 67),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                '잠깐! ',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  height: 1.63,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '오늘도 ',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '플리닉',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: ' 하실꺼죠?',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ])),
            ],
          ),
        ),
        SizedBox(height: spacing_xxs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '플라즈마 기기를 연동하여 사용해 보세요. \n피부관리는 물론 포인트까지 적립됩니다!',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: grey_2,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey.shade200;
                      }
                      return Colors.white;
                    }),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: () {
                  print('관리하러가기 버튼 클릭');
                },
                child: Text(
                  '관리하러가기',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 46),
        Divider(color: grey_3, thickness: 8),
      ],
    );
  }
}
