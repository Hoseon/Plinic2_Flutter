import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/shop/skin_lotion.dart';

class ShopTwo extends StatelessWidget {
  const ShopTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '동일한 피부타입 상품을 추천해드려요.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Icon(LineIcons.angleRight, size: 24),
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => SkinLotionPage(), transition: Transition.native);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/shop/shopping-type-1.png',
                        width: Get.mediaQuery.size.width * 0.416),
                    SizedBox(height: 11.1),
                    Row(
                      children: [
                        Icon(LineIcons.heart),
                        SizedBox(width: 12.3),
                        Icon(LineIcons.shoppingBag)
                      ],
                    ),
                    SizedBox(height: 9.8),
                    Container(
                      width: Get.mediaQuery.size.width * 0.416,
                      child: Text(
                        '수분초 부수팅 에센스 150ml 수분초 부수팅 에센스 150ml 수분초 부수팅 에센스 150ml 수분초 부수팅 에센스 150ml',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          height: 1.63,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: spacing_xxs),
                    Row(
                      children: [
                        Text('35%',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_xxs),
                        Text('24,000원',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    Text('15,600원',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(height: spacing_xxs),
                    Text('ⓒ 1,200 사용가능',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xffeb5757),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SkinLotionPage(), transition: Transition.native);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/shop/home-type-1.png',
                        width: Get.mediaQuery.size.width * 0.416),
                    SizedBox(height: 11.1),
                    Row(
                      children: [
                        Icon(LineIcons.heart),
                        SizedBox(width: 12.3),
                        Icon(LineIcons.shoppingBag)
                      ],
                    ),
                    SizedBox(height: 9.8),
                    Container(
                      width: Get.mediaQuery.size.width * 0.416,
                      child: Text(
                        '아벤느 젠틀 토닝 로션 200ml 한정기획★ ',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          height: 1.63,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: spacing_xxs),
                    Row(
                      children: [
                        Text('5%',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_xxs),
                        Text('27,000원',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    Text('19,440원',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(height: spacing_xxs),
                    Text('ⓒ 4,730 사용가능',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xffeb5757),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => SkinLotionPage(), transition: Transition.native);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/home/home-type-3.png',
                        width: Get.mediaQuery.size.width * 0.416),
                    SizedBox(height: 11.1),
                    Row(
                      children: [
                        Icon(LineIcons.heart),
                        SizedBox(width: 12.3),
                        Icon(LineIcons.shoppingBag)
                      ],
                    ),
                    SizedBox(height: 9.8),
                    Container(
                      width: Get.mediaQuery.size.width * 0.416,
                      child: Text(
                        '수분초 부수팅 에센스 150ml 수분초 부수팅 에센스 150ml 수분초 부수팅 에센스 150ml 수분초 부수팅 에센스 150ml',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          height: 1.63,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: spacing_xxs),
                    Row(
                      children: [
                        Text('35%',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_xxs),
                        Text('24,000원',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    Text('15,600원',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(height: spacing_xxs),
                    Text('ⓒ 1,200 사용가능',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xffeb5757),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SkinLotionPage(), transition: Transition.native);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/home/home-type-4.png',
                        width: Get.mediaQuery.size.width * 0.416),
                    SizedBox(height: 11.1),
                    Row(
                      children: [
                        Icon(LineIcons.heart),
                        SizedBox(width: 12.3),
                        Icon(LineIcons.shoppingBag)
                      ],
                    ),
                    SizedBox(height: 9.8),
                    Container(
                      width: Get.mediaQuery.size.width * 0.416,
                      child: Text(
                        '아벤느 젠틀 토닝 로션 200ml 한정기획★ ',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          height: 1.63,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: spacing_xxs),
                    Row(
                      children: [
                        Text('5%',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(width: spacing_xxs),
                        Text('27,000원',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_xxs),
                    Text('19,440원',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(height: spacing_xxs),
                    Text('ⓒ 4,730 사용가능',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xffeb5757),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xxl),
        Divider(color: grey_3, thickness: 8)
      ],
    );
  }
}
