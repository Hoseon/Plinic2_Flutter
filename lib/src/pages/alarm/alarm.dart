import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/alarm_controller.dart';

class AlarmPage extends GetView<AlarmController> {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AlarmController());

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(LineIcons.arrowLeft, color: black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('알림',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )),
        actions: [
          Obx(() => Row(
                children: [
                  FlutterSwitch(
                    activeColor: primary_dark,
                    width: 60,
                    height: 28,
                    value: controller.isToggle.value,
                    onToggle: (value) {
                      controller.changeToggle(value);
                    },
                  ),
                  SizedBox(width: spacing_m),
                ],
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_s),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.changeTab(0);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: Get.mediaQuery.size.width * 0.5,
                      child: Column(
                        children: [
                          Text('일반',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          SizedBox(height: 15),
                          controller.currentTab.value == 0
                              ? Container(
                                  width: Get.mediaQuery.size.width * 0.5,
                                  height: 1,
                                  color: black)
                              : Container(
                                  width: Get.mediaQuery.size.width * 0.5,
                                  height: 1,
                                  color: Colors.transparent),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.changeTab(1);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: Get.mediaQuery.size.width * 0.5,
                      child: Column(
                        children: [
                          Text('자가습관',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          SizedBox(height: 15),
                          controller.currentTab.value == 1
                              ? Container(
                                  width: Get.mediaQuery.size.width * 0.5,
                                  height: 1,
                                  color: black,
                                )
                              : Container(
                                  width: Get.mediaQuery.size.width * 0.5,
                                  height: 1,
                                  color: white,
                                ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              width: Get.mediaQuery.size.width,
              height: 64,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x4ce2e2e2)),
                color: grey_3,
              ),
              child: Text('각 알림 항목은 좌측 방향으로 밀어서 삭제  가능합니다.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Obx(() => controller.currentTab.value == 0
                ? buildTab1()
                : buildTab2(context)),
          ],
        ),
      ),
    );
  }

  Widget buildTab2(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          width: Get.mediaQuery.size.width,
          height: 54,
          decoration: BoxDecoration(border: Border.all(color: grey_2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('1일 1팩 하기',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('매일 20:00',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(width: spacing_s),
              FlutterSwitch(
                activeColor: primary_dark,
                width: 60,
                height: 26,
                value: controller.switchToggle1.value,
                onToggle: (value) {
                  controller.changeToggle1(value);
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          width: Get.mediaQuery.size.width,
          height: 54,
          decoration: BoxDecoration(border: Border.all(color: grey_2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('30분 이상 홈트하기',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('월,수,금 19:00',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(width: spacing_s),
              FlutterSwitch(
                activeColor: primary_dark,
                width: 60,
                height: 26,
                value: controller.switchToggle2.value,
                onToggle: (value) {
                  controller.changeToggle2(value);
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          width: Get.mediaQuery.size.width,
          height: 54,
          decoration: BoxDecoration(border: Border.all(color: grey_2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text('선크림 바르기',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('매일 20:00',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(width: spacing_s),
              FlutterSwitch(
                activeColor: primary_dark,
                width: 60,
                height: 26,
                value: controller.switchToggle3.value,
                onToggle: (value) {
                  controller.changeToggle3(value);
                },
              ),
            ],
          ),
        ),
        // ListView.separated(
        //   itemCount: 3,
        //   separatorBuilder: (_, index) {
        //     return Divider();
        //   },
        //   itemBuilder: (_, index) {
        //     return ListTile(
        //       leading: Text('1일 1팩 하기',
        //           style: TextStyle(
        //             fontFamily: 'NotoSansKR',
        //             color: black,
        //             fontSize: 14,
        //             fontWeight: FontWeight.w400,
        //             fontStyle: FontStyle.normal,
        //           )),
        //       title: Text('매일 20:00',
        //           style: TextStyle(
        //             fontFamily: 'Roboto',
        //             color: grey_1,
        //             fontSize: 14,
        //             fontWeight: FontWeight.w400,
        //             fontStyle: FontStyle.normal,
        //           )),
        //       trailing: Obx(() => FlutterSwitch(
        //             activeColor: primary_dark,
        //             width: 60,
        //             height: 28,
        //             value: controller.switchToggle1.value,
        //             onToggle: (value) {
        //               controller.changeToggle(value);
        //             },
        //           )),
        //     );
        //   },
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        // )
      ],
    );
  }

  Widget buildTab1() {
    return Column(
      children: [
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          direction: Axis.horizontal,
          actionExtentRatio: 0.2,
          secondaryActions: [
            IconSlideAction(
              caption: '삭제',
              color: Colors.red,
              icon: LineIcons.trash,
              onTap: () {
                print('삭제');
              },
            ),
            IconSlideAction(
              caption: '닫기',
              color: grey_2,
              icon: LineIcons.times,
              onTap: () {
                print('닫기');
              },
            )
          ],
          child: Container(
            alignment: Alignment.centerLeft,
            width: Get.mediaQuery.size.width,
            height: 79,
            decoration: BoxDecoration(
              border: Border.all(color: grey_3),
              color: white,
            ),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(LineIcons.coins, size: 40, color: black),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('포인트 적립',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  Container(
                    width: Get.mediaQuery.size.width * 0.7,
                    child: Text(
                      'Plinic 운영팀에서 포인트를 지급하였습니다.',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              trailing: Text('1시간 전',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: textfields,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ),
        ),
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          direction: Axis.horizontal,
          actionExtentRatio: 0.2,
          secondaryActions: [
            IconSlideAction(
              caption: '삭제',
              color: Colors.red,
              icon: LineIcons.trash,
              onTap: () {
                print('삭제');
              },
            ),
            IconSlideAction(
              caption: '닫기',
              color: grey_2,
              icon: LineIcons.times,
              onTap: () {
                print('닫기');
              },
            )
          ],
          child: Container(
            alignment: Alignment.centerLeft,
            width: Get.mediaQuery.size.width,
            height: 79,
            decoration: BoxDecoration(
              border: Border.all(color: grey_3),
              color: white,
            ),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(LineIcons.calendar, size: 40, color: black),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('데일리 케어',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  Container(
                    width: Get.mediaQuery.size.width * 0.7,
                    child: Text(
                      '오늘도 플리닉으로 피부관리 하시고 누적시 피부관리 하시고 누적시 피부관리 하시고 누적시',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              trailing: Text('1시간 전',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: textfields,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ),
        ),
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          direction: Axis.horizontal,
          actionExtentRatio: 0.2,
          secondaryActions: [
            IconSlideAction(
              caption: '삭제',
              color: Colors.red,
              icon: LineIcons.trash,
              onTap: () {
                print('삭제');
              },
            ),
            IconSlideAction(
              caption: '닫기',
              color: grey_2,
              icon: LineIcons.times,
              onTap: () {
                print('닫기');
              },
            )
          ],
          child: Container(
            alignment: Alignment.centerLeft,
            width: Get.mediaQuery.size.width,
            height: 79,
            decoration: BoxDecoration(
              border: Border.all(color: grey_3),
              color: white,
            ),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Icon(LineIcons.exclamationCircle, size: 40, color: grey_2),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('데일리 케어',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  Container(
                    width: Get.mediaQuery.size.width * 0.7,
                    child: Text(
                      '오늘도 플리닉으로 피부관리 하시고 누적시 피부관리 하시고 누적시 피부관리 하시고 누적시',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_2,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              trailing: Text('2021.12.18',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: textfields,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
