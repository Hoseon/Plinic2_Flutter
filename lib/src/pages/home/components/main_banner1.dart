import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/pages/ble_connect/ble_ready.dart';
import 'package:plinic2/src/pages/ble_connect/ble_ready_v2.dart';

class MainBanner1Page extends StatelessWidget {
  const MainBanner1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Get.toNamed('/bleRedayV2');
            Get.to(() => BleReadyV2Page(), transition: Transition.native);
            // Get.to(() => BleReadyPage(), transition: Transition.native);
          },
          child: Image.asset(
            'assets/images/home/banner-1.png',
            width: Get.mediaQuery.size.width,
            // height: 134,
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    );
  }
}
