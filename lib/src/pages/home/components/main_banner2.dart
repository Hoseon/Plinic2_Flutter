import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class MainBanner2Page extends StatelessWidget {
  const MainBanner2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Image.asset(
          'assets/images/home/ad-banner.png',
          width: Get.mediaQuery.size.width,
          // height: 134,
          fit: BoxFit.fitWidth,
        )
      ],
    );
  }
}
