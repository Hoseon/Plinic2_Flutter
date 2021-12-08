import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/shop/skin_lotion.dart';

class ShopFour extends StatelessWidget {
  const ShopFour({Key? key}) : super(key: key);

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
                '메이크업/미용소품',
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
                  print('메이크업/// 더보기 클릭됨');
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
        SizedBox(height: spacing_l),
        buildItem(
          'assets/images/shop/shopping-makeup-1.png',
          '아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 ',
          4,
          '32,000',
          '22,400',
          '7,410',
        ),
        buildItem(
          'assets/images/shop/shopping-makeup-2.png',
          '[NEW] 코스노리 속눈썹 영양제 기획(본품+미니+속눈썹빗)세트',
          6,
          '20,000',
          '14,400',
          '1,210',
        ),
        buildItem(
          'assets/images/shop/shopping-makeup-3.png',
          '★재유PICK★에뛰드 픽싱 틴트[NEW컬러]',
          3,
          '12,000',
          '8,400',
          '670',
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
          print('bbbcc');
        },
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imgPath,
                  width: Get.mediaQuery.size.width * 0.267,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(width: 13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.mediaQuery.size.width * 0.55,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          height: 1.63,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
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
            ),
            SizedBox(height: spacing_l)
          ],
        ),
      ),
    );
  }
}
