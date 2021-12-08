import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/pages/shop/shop_order_pay.dart';

class ShopCartPage extends StatelessWidget {
  const ShopCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('장바구니'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        print('b');
                      },
                      child: Icon(LineIcons.checkCircle, color: primary)),
                  SizedBox(width: 10.2),
                  TextButton(
                    onPressed: () {},
                    child: Text('전체선택',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Expanded(child: SizedBox(width: 1)),
                  TextButton(
                    onPressed: () {},
                    child: Text('선택삭제',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Divider(color: grey_2, thickness: 1),
            ),
            SizedBox(height: spacing_xxl2),
            buildProduct('assets/images/shop/best-image-1.png',
                '아비브 어성초 카밍 토너 스킨부스터 더블 기획 '),
            SizedBox(height: spacing_m),
            buildCart('토너 + 토너', 1, '27,300'),
            SizedBox(height: spacing_m),
            buildCart('토너 + 스킨', 1, '21,300'),
            SizedBox(height: spacing_xl),
            Divider(thickness: 1, height: 0),
            SizedBox(height: spacing_xxl2),
            buildProduct('assets/images/shop/best-image-2.png',
                '[NEW] 코스노리 속눈썹 영양제 기획(본품+미니+속...'),
            SizedBox(height: spacing_m),
            buildCart('토너 + 토너', 1, '27,300'),
            SizedBox(height: spacing_xxl2),
            Divider(
              thickness: 8,
              height: 1,
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: spacing_s),
                width: Get.mediaQuery.size.width,
                height: 173,
                decoration: BoxDecoration(
                    border: Border.all(color: grey_2),
                    borderRadius: BorderRadius.circular(2)),
                child: Column(
                  children: [
                    SizedBox(height: spacing_m),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('결제 예정금액',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                          Icon(LineIcons.angleUp, color: grey_1, size: 15)
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_xl),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('총 상품금액',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          Text('69,000 원',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_xs),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('배송비',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          Text('+ 0 원',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: spacing_m),
                    Divider(color: black, thickness: 0.2, height: 0),
                    SizedBox(height: spacing_s),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing_s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('총 결제예정금액',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                          Text('63,600원',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(Get.mediaQuery.size.width, 60)),
                  elevation: MaterialStateProperty.all(0.0),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                onPressed: () {
                  Get.to(() => ShopOrderPay(), transition: Transition.native);
                },
                child: Text('주문하기',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ))),
          ],
        ),
      ),
    );
  }

  Padding buildProduct(String imgPath, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            LineIcons.checkCircle,
            color: primary,
          ),
          SizedBox(width: spacing_xs),
          Image.asset(
            imgPath,
            width: Get.mediaQuery.size.width * 0.267,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(width: spacing_m),
          Container(
            width: Get.mediaQuery.size.width * 0.477,
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          )
        ],
      ),
    );
  }

  Padding buildCart(String option, int count, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Container(
        width: Get.mediaQuery.size.width,
        height: 133,
        color: grey_3,
        child: Column(
          children: [
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.only(left: spacing_xl, right: 11.6),
              child: Row(
                children: [
                  Text('선택1',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  SizedBox(width: 11),
                  Expanded(
                    child: Text(option,
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Icon(
                    LineIcons.times,
                    color: grey_1,
                    size: 20,
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.only(left: 71),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 24,
                    color: grey_2,
                    child: Icon(
                      LineIcons.minus,
                      color: white,
                      size: 13,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 24,
                    decoration:
                        BoxDecoration(border: Border.all(color: grey_2)),
                    child: Text(count.toString(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Container(
                    width: 28,
                    height: 24,
                    color: grey_2,
                    child: Icon(
                      LineIcons.plus,
                      color: white,
                      size: 13,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_l),
            Divider(
              color: grey_2,
              thickness: 1,
              height: 1,
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding:
                  const EdgeInsets.only(left: spacing_xl, right: spacing_xs),
              child: Row(
                children: [
                  Expanded(
                    child: Text('결제금액',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Text('$amount원',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
