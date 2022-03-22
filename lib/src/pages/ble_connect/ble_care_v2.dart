import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/loading.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/controller/ble/ble_controller.dart';
import 'package:plinic2/src/pages/ble_connect/ble_care_complete.dart';
import 'package:plinic2/src/pages/ble_connect/components/video_player.dart';
import 'package:plinic2/src/restclient/DeviceLogClient.dart';

//깃허보 스소 올림
class BleCareV2Page extends GetView<BLEController> {
  BleCareV2Page({Key? key}) : super(key: key);
  DeviceLogResponse? deviceLogResponse;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isBleTimeOff.value
        ? completeDevice()
        : WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
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
                  AssetVideoPlayerWidget(),
                  // SizedBox(height: 10),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  //   alignment: Alignment.centerLeft,
                  //   child: Text('🌿[이니스프리] 그린티 밸런싱 스킨케어 세트 🌿',
                  //       style: TextStyle(
                  //         fontFamily: 'NotoSansKR',
                  //         color: grey_2,
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.w400,
                  //         fontStyle: FontStyle.normal,
                  //       )),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  //   alignment: Alignment.centerLeft,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: Text('제품정보 더 알아보기',
                  //         style: TextStyle(
                  //           fontFamily: 'NotoSansKR',
                  //           color: primary,
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w400,
                  //           fontStyle: FontStyle.normal,
                  //         ),
                  //         textAlign: TextAlign.left),
                  //   ),
                  // ),
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
                  controller.isNewDevice.value
                      ? Padding(
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
                                      : Image.asset(
                                          'assets/images/bluetooth-battery.png',
                                          width: 44),
                                  SizedBox(height: spacing_xxs),
                                  controller.isLowBattery.value
                                      ? Text('충전 필요',
                                          style: TextStyle(
                                            fontFamily: 'NotoSansKR',
                                            color: grey_2,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ))
                                      : Text('충전 불필요',
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
                                  exitDialog(context);
                                  // Get.offAllNamed('/tabs');
                                  // BLEController.to.bleOff();
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/bluetooth-device.png',
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
                                        ? Image.asset(
                                            'assets/images/bluetooth-mute.png',
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
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 46),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primary),
                              minimumSize: MaterialStateProperty.all(
                                Size(Get.mediaQuery.size.width, 44),
                              ),
                            ),
                            onPressed: () async {
                              exitDialog(context);
                            },
                            child: Text('케어 종료하기',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.05)
                ],
              ),
            ),
          ));
  }

  void exitDialog(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogTwoButton(
          title: '알림',
          content: '케어가 진행중입니다.\n사용을 종료하시겠습니까?',
          button1Text: '계속 진행할께요.',
          button2Text: '네, 종료할께요',
          button1Click: () {
            Get.back();
          },
          button2Click: () async {
            if (BLEController.to.isNewDevice.value) {
              await BLEController.to.bleOff(); //v2디바이스 일경우 전원 off종료 보냄
            } else {
              await BLEController.to.v1_disconnect();
            }
            Get.back();

            //여기 누적 팝업 불러오기
            // await BLEController.to.saveDeviceLog().then((value) async {
            //   deviceLogResponse = value;
            //   Get.back();
            //   await Get.to(() => BleCareCompletePage(
            //         deviceLogResponse: deviceLogResponse!,
            //       ));
            //   // await savedDialog(context, deviceLogResponse!);
            // });
          },
        );
      },
    );
  }

  Future<void> savedDialog(context, DeviceLogResponse deviceLogResponse) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogOneButton(
          title:
              '오늘의 사용 ${TimerTextFormatter.format(deviceLogResponse.pointsum!)}',
          content: '케어가 종료되었습니다.\n월간 플리닉으로 기록을 확인해보세요',
          buttonText: '확인',
          buttonClick: () async {
            Get.back();
            await Get.offAllNamed('/tabs');
          },
        );
      },
    );
  }

  Widget completeDevice() {
    return FutureBuilder(
        future: controller.test(),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          }

          if (snapshot.hasData) {
            deviceLogResponse = snapshot.data as DeviceLogResponse;
            return BleCareCompletePage(deviceLogResponse: deviceLogResponse);
          }
          return LoadingPage();
        });
  }
}

class TimerTextFormatter {
  static String format(int seconds) {
    // var hundreds = (milliseconds / 10).truncate();
    // var seconds = (hundreds / 100).truncate();
    var minutes = (seconds / 60).truncate();
    var hours = (minutes / 60).truncate();

    var minutesStr = (minutes % 60).toString().padLeft(2, '0');
    var secondsStr = (seconds % 60).toString().padLeft(2, '0');
    var hooursStr = (minutes % 60).toString().padLeft(2, '0');
    // var hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    // return "$minutesStr:$secondsStr.$hundredsStr"; //2021-09-24 미리세컨드 까지 표현
    return '$minutesStr:$secondsStr';
  }
}
