import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/care/device_ranking.dart';

class MonthRankingPage extends StatefulWidget {
  MonthRankingPage({Key? key}) : super(key: key);

  @override
  _MonthRankingPageState createState() => _MonthRankingPageState();
}

class _MonthRankingPageState extends State<MonthRankingPage> {
  late ScrollController _controller;
  double? currentSldeValue = 0.0;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_controller.position.pixels >= _controller.position.minScrollExtent &&
        _controller.position.pixels <= _controller.position.maxScrollExtent) {
      // print((_controller.position.pixels.toInt() /
      //     _controller.position.maxScrollExtent.toInt()));
      setState(() {
        currentSldeValue = (_controller.position.pixels.toInt() /
            _controller.position.maxScrollExtent.toInt());
      });
    }
  }

  final List<Map<String, dynamic>> data = [
    {
      'title': '기기사용 TOP',
      'desc': '피부미녀',
      'desc2': '(115분 사용)',
      'imagePath': 'assets/images/care/rank-1.png',
    },
    {
      'title': '자가습관 TOP',
      'desc': '매일실천',
      'desc2': '(9,224P 적립)',
      'imagePath': 'assets/images/care/rank-2.png',
    },
    {
      'title': '기기사용 TOP',
      'desc': '피부미녀',
      'desc2': '(115분 사용)',
      'imagePath': 'assets/images/care/rank-1.png',
    },
    {
      'title': '자가습관 TOP',
      'desc': '매일실천',
      'desc2': '(9,224P 적립)',
      'imagePath': 'assets/images/care/rank-2.png',
    },
  ];

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
        SizedBox(height: 44),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text(
                '이달의 활동 랭킹',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Container(
          width: Get.mediaQuery.size.width,
          height: 148,
          decoration: BoxDecoration(
            boxShadow: [
              // BoxShadow(
              //     color: Color(0x0c000000),
              //     offset: Offset(0, 4),
              //     blurRadius: 4,
              //     spreadRadius: 0)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: spacing_xl),
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: spacing_xs),
                  child: Container(
                      width: 160,
                      height: 158,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: grey_2),
                          boxShadow: [
                            BoxShadow(
                                color: grey_2,
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(height: spacing_s),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: spacing_m),
                            child: Row(
                              children: [
                                Text(
                                  data[index]['title'],
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR',
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: spacing_xxl),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: spacing_m, right: spacing_s),
                            child: Row(
                              children: [
                                Image.asset(data[index]['imagePath']),
                                SizedBox(width: spacing_s),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      data[index]['desc'],
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    Text(
                                      data[index]['desc2'],
                                      style: TextStyle(
                                        fontFamily: 'NotoSansKR',
                                        color: grey_1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: spacing_m,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(DeviceRanking(),
                                  transition: Transition.native);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacing_m),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '랭킹확인',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansKR',
                                      color: grey_1,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                );
              },
            ),
          ),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: LinearProgressIndicator(
            value: currentSldeValue,
            color: primary,
            backgroundColor: grey_2,
            minHeight: 1,
          ),
        ),
        // SizedBox(height: 10),
        // LinearPercentIndicator(
        //   padding: EdgeInsets.symmetric(horizontal: spacing_xl),
        //   width: Get.mediaQuery.size.width,
        //   lineHeight: 1.0,
        //   percent: 0.3,
        //   linearStrokeCap: LinearStrokeCap.roundAll,
        //   backgroundColor: grey_2,
        //   progressColor: primary,
        // ),
      ],
    );
  }
}
