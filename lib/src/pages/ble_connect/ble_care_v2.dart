import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/ble/ble_controller.dart';
import 'package:plinic2/src/pages/ble_connect/components/timer_text.dart';
import 'package:table_calendar/table_calendar.dart';

class BleCareV2Page extends GetView<BLEController> {
  BleCareV2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: black,
            leading: SizedBox(),
            elevation: 0.0,
            title: Text(
              '케어모드',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          backgroundColor: black,
          body: Column(
            children: [
              Image.asset(
                'assets/images/bluetoothe-care.png',
                width: Get.mediaQuery.size.width,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: Text('🌿[이니스프리] 그린티 밸런싱 스킨케어 세트 🌿',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_2,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text('제품정보 더 알아보기',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.left),
                ),
              ),
              SizedBox(height: 55),
              Text('피부가 좋아지는 시간입니다.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(height: 30),
              Text(
                TimerTextFormatter.format(controller.bleTime.value),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: spacing_xs),
              Text('케어 시간 안내',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              Expanded(child: SizedBox(height: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        controller.isLowBattery.value
                            ? Image.asset(
                                'assets/images/battery-full-solid-default.png',
                                width: 44)
                            : Image.asset('assets/images/bluetooth-battery.png',
                                width: 44),
                        SizedBox(height: spacing_xxs),
                        Text('충전 불필요',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Get.offAllNamed('/tabs');
                        BLEController.to.bleOff();
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/bluetooth-device.png',
                              width: 44),
                          SizedBox(height: spacing_xxs),
                          Text('기기 전원 종료',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        controller.isSoundOn.value
                            ? controller.bleSoundOff()
                            : controller.bleSoundOn();
                      },
                      child: Column(
                        children: [
                          controller.isSoundOn.value
                              ? Image.asset('assets/images/bluetooth-mute.png',
                                  width: 44)
                              : Image.asset(
                                  'assets/images/deaf-solid-default.png',
                                  width: 44),
                          SizedBox(height: spacing_xxs),
                          Text('기기 음소거',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: Get.mediaQuery.size.height * 0.05)
            ],
          ),
        ));
  }
}

class TimerTextFormatter {
  static String format(int seconds) {
    // var hundreds = (milliseconds / 10).truncate();
    // var seconds = (hundreds / 100).truncate();
    var minutes = (seconds / 60).truncate();

    var minutesStr = (minutes % 60).toString().padLeft(2, '0');
    var secondsStr = (seconds % 60).toString().padLeft(2, '0');
    // var hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    // return "$minutesStr:$secondsStr.$hundredsStr"; //2021-09-24 미리세컨드 까지 표현
    return '$minutesStr:$secondsStr';
  }
}
