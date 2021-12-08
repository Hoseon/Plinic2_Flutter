import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/ble_connect/components/timer_text.dart';

class BleCarePage extends StatefulWidget {
  const BleCarePage({Key? key}) : super(key: key);

  @override
  State<BleCarePage> createState() => _BleCarePageState();
}

class _BleCarePageState extends State<BleCarePage> {
  Stopwatch stopwatch = Stopwatch();

  var timer2;

  @override
  void initState() {
    super.initState();
    stopwatch.start();
  }

  @override
  @override
  Widget build(BuildContext context) {
    setState(() {
      timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
        // debugPrint('Print after 1 seconds');
        if (TimerTextFormatter.format(stopwatch.elapsedMilliseconds) == '04') {
          stopwatch.stop();
          timer.cancel();
          Get.back();
        }
        // print(TimerTextFormatter.format(stopwatch.elapsedMilliseconds));
      });
    });
    return Scaffold(
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
          Container(
              child: Center(
            child: TimerText(stopwatch: stopwatch),
          )),
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
                    Image.asset('assets/images/bluetooth-battery.png',
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
                    stopwatch.stop();
                    timer2.cancel();
                    Get.back();
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
                Column(
                  children: [
                    Image.asset('assets/images/bluetooth-mute.png', width: 44),
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
                )
              ],
            ),
          ),
          SizedBox(height: Get.mediaQuery.size.height * 0.05)
        ],
      ),
    );
  }
}

class TimerTextFormatter {
  static String format(int milliseconds) {
    var hundreds = (milliseconds / 10).truncate();
    var seconds = (hundreds / 100).truncate();
    var minutes = (seconds / 60).truncate();

    var minutesStr = (minutes % 60).toString().padLeft(2, '0');
    var secondsStr = (seconds % 60).toString().padLeft(2, '0');
    var hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    // return "$minutesStr:$secondsStr.$hundredsStr"; //2021-09-24 미리세컨드 까지 표현
    return '$minutesStr';
  }
}
