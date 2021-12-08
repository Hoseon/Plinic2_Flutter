import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';

class ShopTab2First extends StatelessWidget {
  const ShopTab2First({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/shop/shopping-md-pick-1.png',
          width: Get.mediaQuery.size.width,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('시스올로지, 전 제품 할인 Day!',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            Text('~10%',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ))
          ]),
        ),
        SizedBox(height: spacing_xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('#구매 시, 시스올로지 체험 키트 증정',
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/shop/shopping-sub-1-1.png',
                    width: Get.mediaQuery.size.width * 0.267,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: spacing_s),
                  Container(
                    width: Get.mediaQuery.size.width * 0.267,
                    height: 36,
                    child: Text(
                      '젠틀 브리즈 핸드크림 50ml 젠틀 브리즈 핸드크림 50ml 젠틀 브���즈 핸드크림 50ml 젠틀 브리즈 핸드크림 50ml',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('18,000원',
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
                    'assets/images/shop/shopping-sub-1-2.png',
                    width: Get.mediaQuery.size.width * 0.267,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: spacing_s),
                  Container(
                    width: Get.mediaQuery.size.width * 0.267,
                    height: 36,
                    child: Text(
                      '오션 드라이브 핸드크림 50ml 오션 드라이브 핸드크림 50ml 오션 드라이브 핸드크림 50ml',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('18,000원',
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
                    'assets/images/shop/shopping-sub-1-3.png',
                    width: Get.mediaQuery.size.width * 0.267,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: spacing_s),
                  Container(
                    width: Get.mediaQuery.size.width * 0.267,
                    height: 36,
                    child: Text(
                      '오션 드라이브 바디클렌저 300ml 오션 드라이브 바디클렌저 300ml 오션 드라이브 바디클렌저 300ml',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('36,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xxl2)
      ],
    );
  }
}
