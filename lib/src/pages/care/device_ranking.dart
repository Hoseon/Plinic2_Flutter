import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/care_controller.dart';

class DeviceRanking extends GetView<CareController> {
  DeviceRanking({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> data = [
    {
      'title': '착한수분원해여',
      'desc': '134분',
      'desc2': '(115분 사용)',
      'imagePath': 'assets/images/care/ranking-1.png',
    },
    {
      'title': '홍길동',
      'desc': '93분',
      'desc2': '(9,224P 적립)',
      'imagePath': 'assets/images/care/ranking-2.png',
    },
    {
      'title': '매일관리',
      'desc': '91분',
      'desc2': '(115분 사용)',
      'imagePath': 'assets/images/care/ranking-3.png',
    },
    {
      'title': '피부좋아져라',
      'desc': '90분',
      'desc2': '(9,224P 적립)',
      'imagePath': 'assets/images/care/ranking-4.png',
    },
    {
      'title': '플리닉조아여',
      'desc': '91분',
      'desc2': '(9,224P 적립)',
      'imagePath': 'assets/images/care/ranking-5.png',
    },
    {
      'title': '안녕하셍',
      'desc': '90분',
      'desc2': '(9,224P 적립)',
      'imagePath': 'assets/images/care/ranking-6.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(CareController());
    return Scaffold(
        appBar: CustomAppbar('기기 사용 랭킹'),
        backgroundColor: white,
        body: Obx(() {
          if (controller.careCurrentIndex.value == 0) {
            return buildListView();
          } else if (controller.careCurrentIndex.value == 1) {
            return buildListView();
          } else {
            return buildListView();
          }
        }));
  }

  Widget buildMyRankgin() {
    return Column(
      children: [
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.only(left: 34, right: 41),
          child: Row(
            children: [
              Image.asset('assets/images/care/m-ranking-1.png'),
              SizedBox(width: 50),
              Column(
                children: [
                  Text(
                    '현재순위',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '122위',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                      height: 60, child: VerticalDivider(color: grey_3))),
              // SizedBox(
              //   width: 50,
              //   child: VerticalDivider(
              //     color: grey_2,
              //   ),
              // ),
              Column(
                children: [
                  Text(
                    '누적시간',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text('35분',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              )
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Divider(
          thickness: 15,
          color: grey_3,
        ),
        SizedBox(height: spacing_l),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => controller.careCurrentIndex.value == 0
                ? Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.updateCurrentIndex(0);
                        },
                        child: Container(
                          child: Text('일간',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        width: Get.mediaQuery.size.width / 3,
                        child: Divider(
                          color: black,
                          thickness: 2,
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.updateCurrentIndex(0);
                        },
                        child: Container(
                          child: Text('일간',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_2,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        width: Get.mediaQuery.size.width / 3,
                        child: Divider(
                          color: Colors.transparent,
                          thickness: 2,
                        ),
                      )
                    ],
                  )),
            Obx(() => controller.careCurrentIndex.value == 1
                ? Column(
                    children: [
                      Text('주간',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_xs),
                      Container(
                        width: Get.mediaQuery.size.width / 3,
                        child: Divider(
                          color: black,
                          thickness: 2,
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.updateCurrentIndex(1);
                        },
                        child: Text('주간',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        width: Get.mediaQuery.size.width / 3,
                        child: Divider(
                          color: Colors.transparent,
                          thickness: 2,
                        ),
                      )
                    ],
                  )),
            Obx(() => controller.careCurrentIndex.value == 2
                ? Column(
                    children: [
                      Text('월간',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(height: spacing_xs),
                      Container(
                        width: Get.mediaQuery.size.width / 3,
                        child: Divider(
                          color: black,
                          thickness: 2,
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.updateCurrentIndex(2);
                        },
                        child: Text('월간',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      SizedBox(height: spacing_xs),
                      Container(
                        width: Get.mediaQuery.size.width / 3,
                        child: Divider(
                          color: Colors.transparent,
                          thickness: 2,
                        ),
                      )
                    ],
                  )),
          ],
        )
      ],
    );
  }

  Widget daily(index) {
    return Padding(
      padding: const EdgeInsets.only(left: spacing_xl, right: spacing_xxl2),
      child: Column(
        children: [
          SizedBox(height: spacing_xl),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(index.toString(),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: grey_1,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(width: spacing_m),
              Image.asset(data[index - 1]['imagePath'].toString()),
              SizedBox(width: spacing_m),
              Expanded(
                child: Text(data[index - 1]['title'].toString(),
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text(data[index - 1]['desc'].toString(),
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: primary_light,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ],
          ),
          SizedBox(height: spacing_xxs),
          Divider()
        ],
      ),
    );
  }

  Widget weekly(index) {
    return Text(data[index - 1]['desc'].toString());
  }

  Widget monthly(index) {
    return Text(data[index - 1]['desc2'].toString());
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: data.length + 1,
      itemBuilder: (_, index) {
        if (index == 0) {
          return buildMyRankgin();
        }
        if (index >= 1) {
          if (controller.careCurrentIndex.value == 0) {
            return daily(index);
          } else if (controller.careCurrentIndex.value == 1) {
            return weekly(index);
          } else {
            return monthly(index);
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
