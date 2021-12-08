import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/ble_connect/ble_ready.dart';
import 'package:plinic2/src/pages/challenge/before_after_create.dart';
import 'package:plinic2/src/pages/shop/shop_cart.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class PlinicFaB extends StatefulWidget {
  const PlinicFaB({Key? key}) : super(key: key);

  @override
  _PlinicFaBState createState() => _PlinicFaBState();
}

class _PlinicFaBState extends State<PlinicFaB> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      child: Icon(LineIcons.plus),
      labelsStyle: TextStyle(color: primary),
      speedDialChildren: <SpeedDialChild>[
        SpeedDialChild(
          child: const Icon(LineIcons.bluetooth),
          foregroundColor: primary,
          backgroundColor: Colors.white,
          closeSpeedDialOnPressed: true,
          label: '디바이스 케어',
          onPressed: () {
            Get.to(() => BleReadyPage(), transition: Transition.fadeIn);
            setState(() {
              _text = 'You pressed \"Let\'s start a run!\"';
            });
          },
        ),
        SpeedDialChild(
          child: const Icon(LineIcons.shoppingBag),
          foregroundColor: primary,
          backgroundColor: white,
          closeSpeedDialOnPressed: true,
          label: '장바구니',
          onPressed: () {
            Get.to(() => ShopCartPage(), transition: Transition.fadeIn);
            setState(() {
              _text = 'You pressed \"Let\'s go for a walk!\"';
            });
          },
        ),
        SpeedDialChild(
          child: const Icon(LineIcons.pen),
          foregroundColor: primary,
          backgroundColor: white,
          label: '커뮤니티 글쓰기',
          closeSpeedDialOnPressed: true,
          onPressed: () {
            Get.to(() => BeforeAfterCreatePage(),
                transition: Transition.native);
            setState(() {
              _text = 'You pressed \"Let\'s go cycling!\"';
            });
          },
        ),
      ],
      closedForegroundColor: white,
      openForegroundColor: primary,
      closedBackgroundColor: primary,
      openBackgroundColor: white,
    );
  }
}
