import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class ShopTab2Three extends StatelessWidget {
  const ShopTab2Three({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/shop/shopping-md-pick-3.png',
          width: Get.mediaQuery.size.width,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: spacing_m),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('인플루언서 픽!아이템',
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
          child: Text('#뷰티 좀 써봤다는 인플루언서들이 추천하는 그것.',
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
                  'assets/images/shop/shopping-sub-3-1.png',
                  width: Get.mediaQuery.size.width * 0.267,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: spacing_s),
                Container(
                  width: Get.mediaQuery.size.width * 0.267,
                  height: 36,
                  child: Text('달바) 워터풀 슬리핑 팩',
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
                  'assets/images/shop/shopping-sub-3-2.png',
                  width: Get.mediaQuery.size.width * 0.267,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: spacing_s),
                Container(
                  width: Get.mediaQuery.size.width * 0.267,
                  height: 36,
                  child: Text('드림 래쉬 컬러',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                SizedBox(height: spacing_xxs),
                Text('14,880원',
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
                  'assets/images/shop/shopping-sub-3-3.png',
                  width: Get.mediaQuery.size.width * 0.267,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: spacing_s),
                Container(
                  width: Get.mediaQuery.size.width * 0.267,
                  height: 36,
                  child: Text('스킨 파라다이스 퓨어 모이스처 선 로...',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                SizedBox(height: spacing_xxs),
                Text('24,180원',
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
