import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class ShopTab2Two extends StatelessWidget {
  const ShopTab2Two({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/shop/shopping-md-pick-2.png',
          width: Get.mediaQuery.size.width,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: spacing_m),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('낫씨백, Brand Day',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('#구매 시, 미스트노즐&미니 토너 증정',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_1,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_xxl2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/shop/shopping-sub-2-1.png',
                  width: Get.mediaQuery.size.width * 0.267,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: spacing_s),
                Container(
                  width: Get.mediaQuery.size.width * 0.267,
                  height: 36,
                  child: Text('원 샷 비타민 트리 (항산화효과)250ml',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                SizedBox(height: spacing_xxs),
                Text('15,200원',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/shop/shopping-sub-2-2.png',
                  width: Get.mediaQuery.size.width * 0.267,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: spacing_s),
                Container(
                  width: Get.mediaQuery.size.width * 0.267,
                  height: 36,
                  child: Text('원 샷 녹두싹 (자극완화효과) 250ml',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                SizedBox(height: spacing_xxs),
                Text('15,200원',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/shop/shopping-sub-2-3.png',
                  width: Get.mediaQuery.size.width * 0.267,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: spacing_s),
                Container(
                  width: Get.mediaQuery.size.width * 0.267,
                  height: 36,
                  child: Text('드롭 인 뮤코 스네일 (트러블케어효과)...',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                SizedBox(height: spacing_xxs),
                Text('18,900원',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            )
          ]),
        ),
        SizedBox(height: spacing_xxl2),
      ],
    );
  }
}
