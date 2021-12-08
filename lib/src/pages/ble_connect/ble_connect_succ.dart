import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/ble/ble_controller.dart';

class BleConnectSuccPage extends StatefulWidget {
  const BleConnectSuccPage({Key? key}) : super(key: key);

  @override
  State<BleConnectSuccPage> createState() => _BleConnectSuccPageState();
}

class _BleConnectSuccPageState extends State<BleConnectSuccPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.toNamed('/bleCare');
      // Get.offAllNamed('/bleCare');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/bleutooth.png'),
            SizedBox(height: 82),
            Text('연동에 성공하였습니다.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_2,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
            SizedBox(height: spacing_xs),
            Text('케어를 시작해주세요.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            Expanded(child: SizedBox(height: 1)),
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
                  BLEController.to.forceStopScanning();
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
        ));
  }
}
