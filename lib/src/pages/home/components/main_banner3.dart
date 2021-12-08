import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class MainBanner3Page extends StatelessWidget {
  const MainBanner3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Image.asset(
          'assets/images/home/banner-2.png',
          width: Get.mediaQuery.size.width,
          fit: BoxFit.fitWidth,
        )
      ],
    );
  }
}
