import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/controller/ble/ble_controller.dart';
import 'package:plinic2/src/pages/ble_connect/components/all_confetti.dart';
import 'package:plinic2/src/restclient/DeviceLogClient.dart';

import 'components/timer_text_formatter.dart';

class BleCareCompletePage extends GetView<BLEController> {
  BleCareCompletePage({Key? key, required this.deviceLogResponse})
      : super(key: key);
  DeviceLogResponse? deviceLogResponse;

  @override
  Widget build(BuildContext context) {
    if (deviceLogResponse!.pointsum! >= 150) {
      //오늘의 성공페이지 보여줌
      return buildSucess();
    } else {
      //오늘의 그냥 누적페이지 보여줌
      return buildNormal();
    }
  }

  WillPopScope buildSucess() {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor: white,
            body: AllConfettiWidget(child: buildSucessBody())));
  }

  WillPopScope buildNormal() {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(backgroundColor: white, body: buildNormalBody()));
  }

  Widget buildSucessBody() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: Get.mediaQuery.size.width * 0.15),
          Text(
            '케어 종료',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 177),
          Text(
            '${TimerTextFormatter.secondFormat(deviceLogResponse!.pointsum!.toInt())}',
            style: TextStyle(
                color: primary_dark,
                fontWeight: FontWeight.w500,
                fontFamily: 'NotoSans',
                fontStyle: FontStyle.normal,
                fontSize: 36.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: Get.mediaQuery.size.width * 0.4),
              Expanded(
                child: Text(
                  '오늘 성공',
                  style: TextStyle(
                      color: grey_1,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NotoSans',
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                ),
              ),
              SvgPicture.asset('assets/images/care/celebration.svg'),
            ],
          ),
          Text(
            '오늘 총 사용시간이 표시됩니다.\n월간 플리닉으로 기록을 확인해보세요.',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: grey_1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: spacing_m),
          Expanded(child: SizedBox(height: 1)),
          homeButton()
        ],
      ),
    );
  }

  Widget buildNormalBody() {
    return Stack(
      children: [
        Positioned(
            top: Get.mediaQuery.size.height * 0.35,
            left: Get.mediaQuery.size.width * 0.16,
            child: SvgPicture.asset('assets/images/care/ghost1.svg')),
        Positioned(
            top: Get.mediaQuery.size.height * 0.25,
            right: Get.mediaQuery.size.width * 0.16,
            child: SvgPicture.asset('assets/images/care/ghost2.svg')),
        Center(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: Get.mediaQuery.size.width * 0.15),
                  Text(
                    '케어 종료',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 177),
                  Text(
                    '${TimerTextFormatter.secondFormat(deviceLogResponse!.pointsum!.toInt())}',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary_dark,
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: spacing_xxl2),
                  Text(
                    '다시 도전',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: grey_1,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: spacing_xxl),
                  Text(
                    '케어가 종료되었습니다.\n월간 플리닉으로 기록을 확인해보세요',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Expanded(child: SizedBox(height: 1)),
              homeButton()
            ],
          ),
        )
      ],
    );
  }

  Widget homeButton() {
    return Container(
      width: Get.mediaQuery.size.width,
      height: 65,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          elevation: MaterialStateProperty.all<double>(0.0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        ),
        onPressed: () async {
          await Get.offAllNamed('/tabs');
        },
        child: Text(
          '홈으로',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: grey_3,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
