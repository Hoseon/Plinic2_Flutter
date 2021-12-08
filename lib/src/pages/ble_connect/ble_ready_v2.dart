import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/ble/ble_controller.dart';
import 'package:plinic2/src/controller/notification_controller.dart';
import 'package:plinic2/src/pages/ble_connect/ble_care.dart';
import 'package:plinic2/src/pages/ble_connect/ble_care_v2.dart';
import 'package:plinic2/src/pages/ble_connect/ble_connect_succ.dart';

class BleReadyV2Page extends GetView<BLEController> {
  BleReadyV2Page({Key? key}) : super(key: key);
  bool? connectBle = false;

  @override
  Widget build(BuildContext context) {
    Get.put<BLEController>(BLEController());
    return Obx(
      () => controller.startNotify.value
          ? BleConnectSuccPage()
          : Obx(() => controller.connectBle.value ? bleConnect() : bleReady()),
    );
  }

  Scaffold bleReady() {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/bleutooth.png'),
          SizedBox(height: 82),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('보유하고 계신 플리닉 기기의 \n전원을 켜신 후  연동 해주세요.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_2,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
          Expanded(child: SizedBox(height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primary),
                minimumSize: MaterialStateProperty.all(
                  Size(Get.mediaQuery.size.width, 44),
                ),
              ),
              onPressed: () {
                BLEController.to.startBle(true);
              },
              child: Text('기기 연동하기',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: ElevatedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Color(0x42566789))),
                minimumSize: MaterialStateProperty.all(
                  Size(Get.mediaQuery.size.width, 44),
                ),
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.grey.shade200;
                  }
                  return Colors.transparent;
                }),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text(
                '취소하기',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          SizedBox(height: 44),
        ],
      ),
    );
  }

  Scaffold bleConnect() {
    BLEController.to.initBle();
    // Get.put(() => BLEController(), permanent: true);
    // Get.put(() => NotificationController(), permanent: true);
    return Scaffold(
      backgroundColor: black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/bleutooth.png'),
          SizedBox(height: 82),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '연동 중입니다.\n기기를 종료하지 말아주세요.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_2,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          SizedBox(height: 92),
          CircularProgressIndicator(
            color: primary,
            strokeWidth: 4,
          ),
          Expanded(child: SizedBox(height: 1)),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 46),
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(primary),
          //       minimumSize: MaterialStateProperty.all(
          //         Size(Get.mediaQuery.size.width, 44),
          //       ),
          //     ),
          //     onPressed: () {
          //       Get.to(() => BleCarePage());
          //     },
          //     child: Text('기기 연동하기',
          //         style: TextStyle(
          //           fontFamily: 'NotoSansKR',
          //           color: white,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w700,
          //           fontStyle: FontStyle.normal,
          //         )),
          //   ),
          // ),
          // SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: ElevatedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Color(0x42566789))),
                minimumSize: MaterialStateProperty.all(
                  Size(Get.mediaQuery.size.width, 44),
                ),
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.grey.shade200;
                  }
                  return Colors.transparent;
                }),
              ),
              onPressed: () async {
                controller.forceStopScanning();
                Get.back();
              },
              child: Text(
                '취소하기',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          SizedBox(height: 44),
        ],
      ),
    );
  }
}
