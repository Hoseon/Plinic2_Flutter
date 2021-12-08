import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/shop_controller.dart';

class ShopTab extends StatelessWidget {
  ShopTab({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ShopController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.mediaQuery.size.width,
      padding: EdgeInsets.only(left: spacing_xl),
      height: Platform.isIOS ? 31 : 33,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: spacing_m),
        itemCount: data.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              ShopController.to.changeCurrentTab(index);
            },
            child: Obx(
              () => controller.currentShopTab.value == index
                  ? Padding(
                      padding: const EdgeInsets.only(right: 1),
                      child: Column(
                        children: [
                          Text(
                            // controller.currentShopTab.toString(),
                            data[index]['title'],
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            width: Get.mediaQuery.size.width * 0.171,
                            height: 2,
                            decoration: BoxDecoration(
                              color: black,
                            ),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 1),
                      child: Column(
                        children: [
                          Text(
                            // controller.currentShopTab.toString(),
                            data[index]['title'],
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            width: Get.mediaQuery.size.width * 0.171,
                            height: 2,
                            decoration: BoxDecoration(
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  final List<Map<String, dynamic>> data = [
    {
      'title': '홈',
    },
    {
      'title': 'MD 추천',
    },
    {
      'title': '베스트',
    },
    {
      'title': '특가',
    },
    {
      'title': '신상품',
    },
  ];
}
