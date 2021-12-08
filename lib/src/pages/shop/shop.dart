import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/shop_controller.dart';
import 'package:plinic2/src/pages/alarm/alarm.dart';
import 'package:plinic2/src/pages/my/my_test.dart';
import 'package:plinic2/src/pages/plinic_fab.dart';
import 'package:plinic2/src/pages/shop/components/shop_cupon.dart';
import 'package:plinic2/src/pages/shop/components/shop_first.dart';
import 'package:plinic2/src/pages/shop/components/shop_five.dart';
import 'package:plinic2/src/pages/shop/components/shop_four.dart';
import 'package:plinic2/src/pages/shop/components/shop_tab.dart';
import 'package:plinic2/src/pages/shop/components/shop_tab2_first.dart';
import 'package:plinic2/src/pages/shop/components/shop_tab2_three.dart';
import 'package:plinic2/src/pages/shop/components/shop_tab2_two.dart';
import 'package:plinic2/src/pages/shop/components/shop_tab3_first.dart';
import 'package:plinic2/src/pages/shop/components/shop_tab4_first.dart';
import 'package:plinic2/src/pages/shop/components/shop_tab4_three.dart';
import 'package:plinic2/src/pages/shop/components/shop_tab4_two.dart';
import 'package:plinic2/src/pages/shop/components/shop_three.dart';
import 'package:plinic2/src/pages/shop/components/shop_two.dart';
import 'package:plinic2/src/pages/shop/shop_search.dart';

class ShopPage extends GetView<ShopController> {
  ShopPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> data = [
    {
      'title': '플리닉 추천',
    },
    {
      'title': '기초화장품',
    },
    {
      'title': '마스크팩',
    },
    {
      'title': '건강식품',
    },
    {
      'title': '기타',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(ShopController());
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: white,
      floatingActionButton: PlinicFaB(),
      // Container(
      //   width: 60,
      //   height: 60,
      //   child: FloatingActionButton(
      //     backgroundColor: primary,
      //     onPressed: () {
      //       Get.to(() => ShopCartPage(), transition: Transition.native);
      //     },
      //     child: Icon(
      //       LineIcons.shoppingBag,
      //       color: white,
      //       size: 35,
      //     ),
      //   ),
      // ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSerachBar(),
              ShopTab(controller: controller),
              Obx(() {
                if (controller.currentShopTab.value == 0) {
                  return buildShopTab1();
                } else if (controller.currentShopTab.value == 1) {
                  return buildShopTab2();
                } else if (controller.currentShopTab.value == 2) {
                  return buildShopTab3();
                } else if (controller.currentShopTab.value == 3) {
                  return buildShopTab4();
                } else if (controller.currentShopTab.value == 4) {
                  return buildShopTab5();
                }
                return buildShopTab1();
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShopTab1() {
    return Column(
      children: [
        ShopFirst(),
        ShopTwo(),
        ShopThree(),
        ShopCuponPage(),
        ShopFour(),
        ShopFive(),
        SizedBox(height: spacing_xxl2),
      ],
    );
  }

  Widget buildShopTab2() {
    return Column(
      children: [
        ShopTab2First(),
        ShopTab2Two(),
        ShopTab2Three(),
      ],
    );
  }

  Widget buildShopTab3() {
    return ShopTab3First();
  }

  Widget buildShopTab4() {
    return Column(
      children: [
        ShopTab4First(),
        ShopTab4Two(),
        ShopTab4Three(),
        SizedBox(height: spacing_xl),
        SizedBox(height: spacing_xl),
        SizedBox(height: spacing_xl),
      ],
    );
  }

  Widget buildShopTab5() {
    return Column(
      children: [
        Image.asset(
          'assets/images/shop/shopping-new-1.png',
          width: Get.mediaQuery.size.width,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: spacing_m),
        Image.asset(
          'assets/images/shop/shopping-new-2.png',
          width: Get.mediaQuery.size.width,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: spacing_m),
        Image.asset(
          'assets/images/shop/shopping-new-3.png',
          width: Get.mediaQuery.size.width,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: spacing_m),
        Image.asset(
          'assets/images/shop/shopping-new-4.png',
          width: Get.mediaQuery.size.width,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 7),
        child: Text(
          '쇼핑',
          style: TextStyle(
            fontFamily: 'NotoSansKR',
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_m),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(AlarmPage(), transition: Transition.native);
                  },
                  child: Icon(LineIcons.bell, size: 28, color: black)),
              SizedBox(width: 16),
              InkWell(
                onTap: () {
                  Get.to(MyTestPage(), transition: Transition.native);
                },
                child: Icon(LineIcons.userCircleAlt, size: 28, color: black),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildSerachBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: TextField(
            onTap: () {
              Get.to(() => ShopSearchPage(), transition: Transition.native);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                LineIcons.sistrix,
                color: grey_2,
              ),
              focusColor: grey_1,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: grey_3),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: grey_1),
              ),
              hintText: '어떤 상품을 찾으시나요?',
              hintStyle: TextStyle(
                fontFamily: 'NotoSansKR',
                color: textfields,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_m),
      ],
    );
  }
}
