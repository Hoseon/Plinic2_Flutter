import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/shop/shop_order_list.dart';
import 'package:plinic2/src/pages/tabs/tabs.dart';

class PaySuccPage extends StatelessWidget {
  const PaySuccPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.offAll(() => Tabs(), transition: Transition.native);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: white,
          elevation: 0.3,
          // leading: SizedBox(width: 1),
          title: Text('결제완료',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 33.6),
              Container(
                  alignment: Alignment.center,
                  child: Icon(LineIcons.checkCircle, color: primary, size: 70)),
              SizedBox(height: 29.6),
              Text(
                '결제가 완료 되었습니다! \n상품을 포장해서 보내드릴께요!',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 14,
                  height: 1.64,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: spacing_xxl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xxl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => ShopOrderList(),
                            transition: Transition.native);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.mediaQuery.size.width * 0.400,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: grey_2,
                        ),
                        child: Text(
                          '주문 상세보기',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 14,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => Tabs(), transition: Transition.native);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.mediaQuery.size.width * 0.400,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: grey_2,
                        ),
                        child: Text('쇼핑 계속하기',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Divider(
                thickness: 8,
                color: grey_3,
              ),
              SizedBox(height: spacing_m),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('주문번호',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  SizedBox(width: 15),
                  Text('12485624538445',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              ),
              SizedBox(height: spacing_m),
              Divider(
                thickness: 8,
                color: grey_3,
              ),
              buildPay(),
              buildPay(),
              Divider(
                thickness: 8,
                color: grey_3,
                height: 0,
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: spacing_s),
                  width: Get.mediaQuery.size.width,
                  height: 160,
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
                          Icon(
                            LineIcons.angleUp,
                            color: grey_1,
                            size: 20,
                          )
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
                      ),
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
                  height: 192,
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
                          Text('결제금액',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                          Icon(
                            LineIcons.angleUp,
                            color: grey_1,
                            size: 20,
                          )
                        ],
                      ),
                      SizedBox(height: spacing_xxl),
                      Row(
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
                      SizedBox(height: spacing_xs),
                      Row(
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
                      SizedBox(height: spacing_xs),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('포인트 사용금액',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          Text('- 5,400 ⓒ',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                      SizedBox(height: spacing_m),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('총 결제 금액',
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
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: spacing_xl),
              SizedBox(height: spacing_xl),
              SizedBox(height: spacing_xl),
            ],
          ),
        ),
      ),
    );
  }

  Column buildPay() {
    return Column(
      children: [
        SizedBox(height: spacing_xxl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/shop/best-image-1.png',
                width: Get.mediaQuery.size.width * 0.192,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: spacing_m),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.mediaQuery.size.width * 0.635,
                    child: Text(
                      '아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: spacing_xs),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('27,300원',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(width: spacing_xs),
                      Text('39,000원',
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.lineThrough))
                    ],
                  )
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
                width: Get.mediaQuery.size.width * 0.23,
                child: Text('옵션',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
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
                width: Get.mediaQuery.size.width * 0.23,
                child: Text('옵션',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '2개 (',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: '54,600',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                TextSpan(
                    text: "원)",
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
        Divider()
      ],
    );
  }
}
