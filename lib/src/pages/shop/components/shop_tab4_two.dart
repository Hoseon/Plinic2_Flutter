import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';

class ShopTab4Two extends StatelessWidget {
  const ShopTab4Two({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Image.asset(
            'assets/images/shop/sale-md-2.png',
            width: Get.mediaQuery.size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(height: spacing_m),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('유즈 솔리드 퍼퓸 002 스테이포에버 30ml',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text('4%',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(width: spacing_xxs),
              Text('34,000원',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_2,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_xs),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Text('30,600원',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(width: spacing_xs),
              Expanded(
                child: Text('ⓒ 2,190 사용가능 ',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              InkWell(
                onTap: () {
                  print('bbb');
                },
                child: Icon(
                  LineIcons.heart,
                  size: 20,
                ),
              ),
              SizedBox(width: 25.2),
              InkWell(
                onTap: () {
                  print('ccc');
                },
                child: Icon(
                  LineIcons.shoppingBag,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Divider(
          color: grey_3,
          thickness: 1,
          height: 1,
        )
      ],
    );
  }
}
