import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class ShopFirst extends StatelessWidget {
  const ShopFirst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing_xl),
      width: Get.mediaQuery.size.width,
      height: Get.mediaQuery.size.width * 0.9,
      decoration: BoxDecoration(color: grey_3),
      child: Column(
        children: [
          SizedBox(height: spacing_l),
          Row(
            children: [
              Text(
                'OSPT 맞춤 화장품 ',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing_s),
          Image.asset('assets/images/noni-playing.png'),
          SizedBox(height: spacing_s),
          Row(
            children: [
              Text(
                  '슈퍼푸드 노니🌳 먹어서 좋은건 바르면 더 좋으니까\r\n여름에 사용해도 무겁지않은 가벼운사용감\n피부에 채워지는 강한 생기에너지\n',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
