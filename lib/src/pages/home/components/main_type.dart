import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/tabs_controller.dart';

class MainTypePage extends StatelessWidget {
  const MainTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 48),
        InkWell(
          onTap: () {
            TabsController.to.changePageIndex(3);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text('피부타입 맞춤 상품',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSkinType(
                'assets/images/home/home-type-1.png',
                '눅스 윌 프로디쥬스 멀티 리치 오일 100ml 기획',
                '5',
                '39,800',
                '39,800',
                '6,200',
              ),
              buildSkinType(
                'assets/images/home/home-type-2.png',
                '더 가네샤 요가매트 울트라컴포트 6MM',
                '10',
                '52,200',
                '41,760',
                '11,400',
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(height: 0),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSkinType(
                'assets/images/home/home-type-3.png',
                '리베르 필로우미스트 뉴하우스 100ml',
                '3',
                '33,000',
                '29,700',
                '2,800',
              ),
              buildSkinType(
                'assets/images/home/home-type-4.png',
                '포맨트 올인원 퍼퓸샤워 500ml',
                '12',
                '19,000',
                '18,000',
                '980',
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_xl)
      ],
    );
  }

  Column buildSkinType(String imgPath, String productName, String perSale,
      String salePrice, String price, String usePoint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imgPath,
          width: Get.mediaQuery.size.width * 0.416,
          fit: BoxFit.fitWidth,
        ),
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
          height: 40,
          child: Text(
            productName,
            style: TextStyle(
              color: Color(0xff1d1d1d),
              fontSize: 12,
              fontFamily: 'NotoSansKR',
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
            Text(
              '$perSale%',
              style: TextStyle(
                color: Color(0xff913aff),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(width: spacing_xxs),
            Text(
              '$salePrice원',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Color(0xffe0e0e0),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        SizedBox(height: spacing_xxs),
        Text(
          '$price원',
          style: TextStyle(
            color: Color(0xff1d1d1d),
            fontSize: 16,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(height: spacing_xxs),
        Text(
          'ⓒ $usePoint 사용가능 ',
          style: TextStyle(
            color: Color(0xffeb5757),
            fontSize: 12,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
