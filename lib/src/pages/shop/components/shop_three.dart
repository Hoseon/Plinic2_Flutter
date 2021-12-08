import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/shop/skin_lotion.dart';

class ShopThree extends StatelessWidget {
  const ShopThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '스킨/로션/올인원',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SkinLotionPage(), transition: Transition.native);
                },
                child: Row(
                  children: [
                    Text('더보기',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_2,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    Icon(LineIcons.angleRight, color: grey_2, size: 15)
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        buildItem(
            'assets/images/shop/shopping-skin-1.png',
            '아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 ',
            11,
            '39,000',
            '27,300',
            '2,800'),
        buildItem(
            'assets/images/shop/shopping-skin-2.png',
            '아이소이 장벽/수분/진정 장수진 토너 130ml+크 토너 130ml+크 토너 130ml+크 ',
            8,
            '22,000',
            '15,680',
            '2,160'),
        buildItem(
          'assets/images/shop/shopping-skin-3.png',
          '브링그린 대나무히알루수분토너250mL',
          9,
          '13,000',
          '8,910',
          '840',
        ),
        SizedBox(height: spacing_xl),
        Divider(color: grey_3, thickness: 8, height: 0)
      ],
    );
  }

  Widget buildItem(String imgPath, String title, int percent,
      String originalPrice, String salePrice, String point) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: InkWell(
        onTap: () {
          Get.to(() => SkinLotionPage(), transition: Transition.native);
        },
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imgPath,
                  width: Get.mediaQuery.size.width * 0.16,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(width: 13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.mediaQuery.size.width * 0.67,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: spacing_xxs),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${percent.toString()}%',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_xxs),
                        Text(
                          '$originalPrice원',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: grey_2,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    Row(
                      children: [
                        Text('$salePrice원',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_xxs),
                        Text('ⓒ $point 사용가능',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: spacing_s)
          ],
        ),
      ),
    );
  }
}
