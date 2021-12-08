import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/model/sample_shop_order_list_data.dart';

class ShopOrderDetailPage extends StatelessWidget {
  ShopOrderDetailPage({Key? key, required this.orderListData})
      : super(key: key);
  OrderListData? orderListData;

  @override
  Widget build(BuildContext context) {
    print(orderListData!.name.toString());
    return Scaffold(
      appBar: CustomAppbar('주문내역'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_m),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Text('주문내역 상세보기',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: 17),
            Container(
              width: Get.mediaQuery.size.width,
              height: 52,
              decoration: BoxDecoration(
                color: grey_3,
                border: Border.symmetric(
                  horizontal: BorderSide(color: grey_2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  children: [
                    Text('주문일',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    SizedBox(width: spacing_xs),
                    Container(
                      child: Text(orderListData!.payDate.toString(),
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Image.asset(
                    orderListData!.imgPath.toString(),
                    width: Get.mediaQuery.size.width * 0.192,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: spacing_m),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.mediaQuery.size.width * 0.630,
                        height: 40,
                        child: Text(orderListData!.name.toString(),
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      SizedBox(height: spacing_xs),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${orderListData!.salePrice.toString()}원',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                          SizedBox(width: spacing_xs),
                          Text('${orderListData!.originalPrice.toString()}원',
                              style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: grey_2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.lineThrough))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width * 0.170,
                    child: Text('주문번호',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  SizedBox(width: spacing_xl),
                  Text('124856245384',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 14,
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
                  Container(
                    width: Get.mediaQuery.size.width * 0.170,
                    child: Text('옵션',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  SizedBox(width: spacing_xl),
                  Text('토너 + 토너 / 토너 + 스킨',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 14,
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
                  Container(
                    width: Get.mediaQuery.size.width * 0.170,
                    child: Text('주문수량',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  SizedBox(width: spacing_xl),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '${orderListData!.percent.toString()}개 (',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    TextSpan(
                        text: '${orderListData!.salePrice.toString()}',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    TextSpan(
                        text: '원)',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: grey_1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ]))
                ],
              ),
            ),
            SizedBox(height: spacing_l),
            Divider(),
            SizedBox(height: spacing_xs),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              child: InkWell(
                onTap: () {
                  print('구매확정 클릭됨');
                },
                child: Text('구매확정',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
            SizedBox(height: spacing_xl),
            Divider(thickness: 8, color: grey_3, height: 0),
            SizedBox(height: spacing_xl),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                width: Get.mediaQuery.size.width,
                height: 160,
                padding: EdgeInsets.symmetric(horizontal: spacing_s),
                decoration: BoxDecoration(
                  border: Border.all(color: grey_2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Column(
                  children: [
                    SizedBox(height: spacing_m),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('배송지 정보',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        Icon(LineIcons.angleUp, color: grey_1, size: 20),
                      ],
                    ),
                    SizedBox(height: spacing_xxl),
                    Row(
                      children: [
                        Container(
                          width: Get.mediaQuery.size.width * 0.181,
                          child: Text('수령인',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        SizedBox(width: spacing_xxl),
                        Text('홍길동',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_xs),
                    Row(
                      children: [
                        Container(
                          width: Get.mediaQuery.size.width * 0.181,
                          child: Text('주소지',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        SizedBox(width: spacing_xxl),
                        Text('서울특별시 강남구 강남대로 122, 303호',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                    SizedBox(height: spacing_xs),
                    Row(
                      children: [
                        Container(
                          width: Get.mediaQuery.size.width * 0.181,
                          child: Text('휴대폰',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        SizedBox(width: spacing_xxl),
                        Text('010-1234-5678',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_s),
                width: Get.mediaQuery.size.width,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: grey_2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('결제금액',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    Icon(LineIcons.angleDown, color: grey_1, size: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_s),
                width: Get.mediaQuery.size.width,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: grey_2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('취소 및 교환/반품 안내',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                    Icon(LineIcons.angleDown, color: grey_1, size: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            SizedBox(height: spacing_xl),
            SizedBox(height: spacing_xl)
          ],
        ),
      ),
    );
  }
}
