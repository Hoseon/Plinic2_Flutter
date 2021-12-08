import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/shop/product_detail_cupon.dart';

class ShopCuponPage extends StatelessWidget {
  const ShopCuponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('모바일 쿠폰',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(LineIcons.angleLeft, color: grey_1, size: 20),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Get.to(() => ProductDetailCuponPage(),
                      transition: Transition.native);
                },
                child: Image.asset(
                  'assets/images/shop/starbucks.png',
                  width: Get.mediaQuery.size.width * 0.171,
                  fit: BoxFit.fitWidth,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Get.to(() => ProductDetailCuponPage(),
                      transition: Transition.native);
                },
                child: Image.asset(
                  'assets/images/shop/cu.png',
                  width: Get.mediaQuery.size.width * 0.171,
                  fit: BoxFit.fitWidth,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Get.to(() => ProductDetailCuponPage(),
                      transition: Transition.native);
                },
                child: Image.asset(
                  'assets/images/shop/happymoney.png',
                  width: Get.mediaQuery.size.width * 0.171,
                  fit: BoxFit.fitWidth,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Get.to(() => ProductDetailCuponPage(),
                      transition: Transition.native);
                },
                child: Image.asset(
                  'assets/images/shop/dunkin.png',
                  width: Get.mediaQuery.size.width * 0.171,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Icon(LineIcons.angleRight, color: grey_1, size: 20),
            ],
          ),
        )
      ],
    );
  }
}
