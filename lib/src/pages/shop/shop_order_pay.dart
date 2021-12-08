import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/pages/shop/pay_succ.dart';

class ShopOrderPay extends StatelessWidget {
  const ShopOrderPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('주문하기'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 22),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Text('주문상품',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Divider(color: grey_1),
            ),
            buildProd(
                'assets/images/shop/best-image-1.png',
                '아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 아비브 어성초 카밍 토너 스킨부스터 더블 기획 ',
                '39,000',
                '27,300'),
            buildProd(
                'assets/images/shop/best-image-2.png',
                '[NEW] 코스노리 속눈썹 영양제 기획(본품+미니+속눈썹빗)세트 [NEW] 코스노리 속눈썹 영양제 기획(본품+미니+속눈썹빗)세트 [NEW] 코스노리 속눈썹 영양제 기획(본품+미니+속눈썹빗)세트 [NEW] 코스노리 속눈썹 영양제 기획(본품+미니+속눈썹빗)세트',
                '39,000',
                '27,300'),
            Divider(thickness: 8, color: grey_3, height: 0),
            SizedBox(height: spacing_xl),
            buildAddrInfo(),
            SizedBox(height: spacing_m),
            buildCash(),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_s),
                width: Get.mediaQuery.size.width,
                height: 221,
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
                        Text('결제수단',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        Icon(LineIcons.angleUp, color: grey_1, size: 20)
                      ],
                    ),
                    SizedBox(height: spacing_l),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('휴대폰 결제',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        Icon(LineIcons.checkCircle, size: 22, color: grey_2)
                      ],
                    ),
                    SizedBox(height: spacing_l),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('일반 카드 결제',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        Icon(LineIcons.checkCircle, size: 22, color: grey_2)
                      ],
                    ),
                    SizedBox(height: spacing_l),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('계좌 이체',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: grey_1,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        Icon(LineIcons.checkCircle, size: 22, color: primary)
                      ],
                    ),
                    SizedBox(height: spacing_s),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: spacing_xs),
                      width: Get.mediaQuery.size.width,
                      height: 32,
                      color: grey_3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('은행을 선택해 주세요.',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_2,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                          Icon(LineIcons.angleDown, color: grey_2, size: 15),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Container(
                width: Get.mediaQuery.size.width,
                height: 162,
                decoration: BoxDecoration(
                  border: Border.all(color: grey_2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Column(
                  children: [
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        SizedBox(width: 13.9),
                        Icon(LineIcons.checkCircle, color: primary, size: 20),
                        SizedBox(width: 13.9),
                        Text('전체동의',
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
                    Divider(height: 0),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        SizedBox(width: 13.9),
                        Icon(LineIcons.checkCircle, color: primary, size: 20),
                        SizedBox(width: 13.9),
                        Expanded(
                          child: Text('구독박스 이용 약관 (필수)',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        Icon(LineIcons.angleRight, color: grey_2, size: 15),
                        SizedBox(width: 13.9),
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    Divider(height: 0),
                    SizedBox(height: spacing_m),
                    Row(
                      children: [
                        SizedBox(width: 13.9),
                        Icon(LineIcons.checkCircle, color: primary, size: 20),
                        SizedBox(width: 13.9),
                        Expanded(
                          child: Text('개인정보 취급방침(필수)',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR',
                                color: grey_1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        Icon(LineIcons.angleRight, color: grey_2, size: 15),
                        SizedBox(width: 13.9),
                      ],
                    ),
                    SizedBox(height: spacing_m),
                    // Divider(height: 0),
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
                  Get.offAll(() => PaySuccPage(),
                      transition: Transition.native);
                },
                child: Text('결제하기',
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

  Padding buildCash() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: spacing_s),
        width: Get.mediaQuery.size.width,
        height: 164,
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
                Text('플리닉캐시',
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
            SizedBox(height: spacing_xl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('현재보유 캐시',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '15,400 ',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  TextSpan(
                      text: 'ⓒ',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ]))
              ],
            ),
            SizedBox(height: spacing_xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('사용가능 캐시',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '6,812 ',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  TextSpan(
                      text: 'ⓒ',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ])),
              ],
            ),
            SizedBox(height: spacing_xxs),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: spacing_xxs),
                  width: Get.mediaQuery.size.width * 0.576,
                  height: 28,
                  decoration: BoxDecoration(
                    border: Border.all(color: grey_2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(LineIcons.times, size: 15, color: grey_1),
                      Text('5,400',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                ),
                Expanded(child: SizedBox(width: 7)),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primary),
                      elevation: MaterialStateProperty.all(0.0),
                      minimumSize: MaterialStateProperty.all(
                          Size(Get.mediaQuery.size.width * 0.205, 28))),
                  child: Text('전체사용',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding buildAddrInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: spacing_s),
        width: Get.mediaQuery.size.width,
        height: 335,
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
                Text('배송지 정보 입력',
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
            SizedBox(height: spacing_m),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.mediaQuery.size.width * 0.40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: grey_2),
                  ),
                  child: Text('배송지목록',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  width: Get.mediaQuery.size.width * 0.40,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: grey_2), color: grey_2),
                  child: Text('직접입력',
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
            buildAddr('홍길동', '서울특별시 강남구 강남대로 122, 303호', '010-1234-5678', true),
            buildAddr(
                '홍길동', '서울특별시 강남구 강남대로 122, 303호', '010-1234-5678', false),
          ],
        ),
      ),
    );
  }

  Widget buildAddr(String name, String addr, String number, bool isDefault) {
    return Column(
      children: [
        SizedBox(height: spacing_l),
        Row(
          children: [
            Container(
              width: Get.mediaQuery.size.width * 0.05,
            ),
            SizedBox(width: 14.2),
            Text(name,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            SizedBox(width: spacing_s),
            isDefault
                ? Container(
                    alignment: Alignment.center,
                    width: 54,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xff3b6693),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('기본 배송지',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  )
                : SizedBox(width: 1),
          ],
        ),
        SizedBox(height: spacing_s),
        Row(
          children: [
            Container(
                width: Get.mediaQuery.size.width * 0.05,
                child: isDefault
                    ? Icon(LineIcons.checkCircle, color: primary, size: 23)
                    : Icon(LineIcons.checkCircle, color: grey_2, size: 23)),
            SizedBox(width: 14.2),
            Text(addr,
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: grey_1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ))
          ],
        ),
        SizedBox(width: spacing_xs),
        Row(
          children: [
            Container(
              width: Get.mediaQuery.size.width * 0.05,
            ),
            SizedBox(width: 14.2),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(number,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ],
        ),
        SizedBox(height: spacing_l),
        Divider(height: 0),
      ],
    );
  }

  Widget buildProd(
      String imgPath, String name, String originalPrice, String salePrice) {
    return Column(
      children: [
        SizedBox(height: spacing_xxl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Image.asset(imgPath,
                  width: Get.mediaQuery.size.width * 0.192,
                  fit: BoxFit.fitWidth),
              SizedBox(width: spacing_m),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.mediaQuery.size.width * 0.635,
                    height: 43,
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
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: spacing_xs),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('$salePrice원',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(width: spacing_xs),
                      Text('$originalPrice원',
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
        Divider()
      ],
    );
  }
}
