import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/pages/home/pay_step1.dart';
import 'package:shimmer/shimmer.dart';

class PayStep0Page extends StatefulWidget {
  PayStep0Page({Key? key}) : super(key: key);

  _PayStep0PageState createState() => _PayStep0PageState();
}

class _PayStep0PageState extends State<PayStep0Page> {
  int selectType = 0;
  bool completeLoad = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        completeLoad = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // body: buildBody(context),
      body: completeLoad ? buildBody(context) : buildLoading(context),
    );
  }

  Widget buildLoading(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Get.mediaQuery.size.width,
            height: 360,
            decoration: BoxDecoration(
              color: grey_2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildshimmer(160, 28, grey_3),
                  ],
                ),
                SizedBox(height: spacing_xxs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildshimmer(160, 28, grey_3),
                  ],
                ),
                SizedBox(height: spacing_l),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildshimmer(216, 20, grey_3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 260,
              padding: const EdgeInsets.symmetric(horizontal: spacing_m),
              decoration: BoxDecoration(
                  border: Border.all(color: grey_2),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  SizedBox(height: spacing_m),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildshimmer(216, 28, grey_3),
                      _buildshimmer(28, 28, grey_3)
                    ],
                  ),
                  SizedBox(height: spacing_s),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildshimmer(12, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(52, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_l),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildshimmer(12, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(52, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xl),
                  Row(
                    children: [
                      _buildshimmer(12, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(230, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_s),
                  Row(
                    children: [
                      _buildshimmer(12, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(230, 12, grey_3),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_l),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: spacing_m),
              decoration: BoxDecoration(
                border: Border.all(color: grey_2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(height: spacing_m),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildshimmer(216, 28, grey_3),
                      _buildshimmer(28, 28, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_s),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildshimmer(12, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(52, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_s),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_s),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildshimmer(12, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(52, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(220, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_s),
                  Row(
                    children: [
                      _buildshimmer(12, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(230, 12, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_s),
                  Row(
                    children: [
                      _buildshimmer(12, 12, grey_2),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(230, 12, grey_3),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xl),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.all(grey_2),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                minimumSize: MaterialStateProperty.all(
                    Size(Get.mediaQuery.size.width, 60))),
            onPressed: () {},
            child: Text('구독 신청하러 가기',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          )
        ],
      ),
    );
  }

  Shimmer _buildshimmer(double width, double height, color) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
      baseColor: color,
      highlightColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: grey_3,
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/home/monthly-pay-image.png',
                width: Get.mediaQuery.size.width,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  top: 38,
                  left: spacing_xs,
                  child: IconButton(
                    icon: Icon(LineIcons.arrowLeft),
                    onPressed: () {
                      Get.back();
                    },
                  )),
              Column(
                children: [
                  Text(
                    '피부관리의 시작',
                    style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontSize: 20,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: spacing_xxs),
                  Text(
                    '플리닉 맞춤 솔루션 ',
                    style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontSize: 20,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: spacing_s),
                  Text(
                    '지금, 변화되는 피부를 경험해보세요.',
                    style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontSize: 14,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 48),
          selectType == 0 ? buildType1_select() : buildType1_unSelect(),
          SizedBox(height: spacing_l),
          selectType == 1 ? buildType2_select() : buildType2_unselect(),
          SizedBox(height: spacing_xl),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
                width: Get.mediaQuery.size.width, height: 60),
            child: ElevatedButton(
              style: ButtonStyle(
                  // side: MaterialStateProperty.all(BorderSide(color: grey_2)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(primary)),
              onPressed: () {
                Get.to(PayStep1Page(), transition: Transition.native);
              },
              child: Text('구독 신청하러 가기',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    fontSize: 16,
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildType2_unselect() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: InkWell(
        onTap: () {
          setState(() {
            selectType = 1;
          });
        },
        child: Container(
          // padding: const EdgeInsets.only(left: spacing_m, right: 0),
          width: Get.mediaQuery.size.width,
          height: 210,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: grey_2),
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                offset: Offset(4, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: spacing_m),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '맞춤형 코스메틱 정기구독',
                      style: TextStyle(
                        color: Color(0xff1d1d1d),
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Expanded(child: SizedBox(width: 1)),
                    Icon(
                      LineIcons.checkCircle,
                      color: grey_2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.only(left: spacing_m, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(LineIcons.check, color: primary, size: 10),
                        SizedBox(width: spacing_xxs),
                        Text(
                          '상품구성 : ',
                          style: TextStyle(
                            color: Color(0xff913aff),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xxs),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '맞춤형 화장품 1종(20ml)',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '맞춤형 마스크팩 5종 (무료배송)',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_m),
              Padding(
                padding: const EdgeInsets.only(left: spacing_m, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(LineIcons.check, color: primary, size: 10),
                        SizedBox(width: spacing_xxs),
                        Text(
                          '구독가격 : ',
                          style: TextStyle(
                            color: Color(0xff913aff),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xxs),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6개월 구독 약정시',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xl),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '매월 35,800원',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '단일 상품 대비',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 20,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        '최대 30% 절약',
                        style: TextStyle(
                          color: white,
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xs),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '해지 시 위약금 없음',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildType2_select() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: Container(
        // padding: const EdgeInsets.only(left: spacing_m, right: 0),
        width: Get.mediaQuery.size.width,
        height: 210,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: primary),
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              offset: Offset(4, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_m),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '맞춤형 코스메틱 정기구독',
                    style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontSize: 16,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Expanded(child: SizedBox(width: 1)),
                  Icon(
                    LineIcons.checkCircle,
                    color: primary,
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.only(left: spacing_m, right: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(LineIcons.check, color: primary, size: 10),
                      SizedBox(width: spacing_xxs),
                      Text(
                        '상품구성 : ',
                        style: TextStyle(
                          color: Color(0xff913aff),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: spacing_xxs),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '맞춤형 화장품 1종(20ml)',
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: spacing_xxs),
                      Text(
                        '맞춤형 마스크팩 5종 (무료배송)',
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.only(left: spacing_m, right: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(LineIcons.check, color: primary, size: 10),
                      SizedBox(width: spacing_xxs),
                      Text(
                        '구독가격 : ',
                        style: TextStyle(
                          color: Color(0xff913aff),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: spacing_xxs),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '6개월 구독 약정시',
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: spacing_xl),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '매월 35,800원',
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_m),
              child: Row(
                children: [
                  Icon(LineIcons.check, color: primary, size: 10),
                  SizedBox(width: spacing_xxs),
                  Text(
                    '단일 상품 대비',
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 20,
                    decoration: BoxDecoration(
                        color: primary, borderRadius: BorderRadius.circular(3)),
                    child: Text(
                      '최대 30% 절약',
                      style: TextStyle(
                        color: white,
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_m),
              child: Row(
                children: [
                  Icon(LineIcons.check, color: primary, size: 10),
                  SizedBox(width: spacing_xxs),
                  Text(
                    '해지 시 위약금 없음',
                    style: TextStyle(
                      color: Color(0xff828282),
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildType1_select() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: InkWell(
        onTap: () {
          print('b');
        },
        child: Container(
          // padding: const EdgeInsets.only(left: spacing_m, right: 0),
          width: Get.mediaQuery.size.width,
          height: 280,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primary),
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                offset: Offset(4, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: spacing_m),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '케어 솔루션 패키지 정기구독',
                      style: TextStyle(
                        color: Color(0xff1d1d1d),
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Expanded(child: SizedBox(width: 1)),
                    Icon(
                      LineIcons.checkCircle,
                      color: primary,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.only(left: spacing_m, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(LineIcons.check, color: primary, size: 10),
                        SizedBox(width: spacing_xxs),
                        Text(
                          '상품구성 : ',
                          style: TextStyle(
                            color: Color(0xff913aff),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xxs),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '플리닉 싱글 플라즈마 디바이스 제공 - 첫달 1회',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '맞춤형 화장품 1종(20ml) - 매월 1회',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '맞춤형 마스크팩 5종 - 매월 1회',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.only(left: spacing_m, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(LineIcons.check, color: primary, size: 10),
                        SizedBox(width: spacing_xxs),
                        Text(
                          '구독가격 : ',
                          style: TextStyle(
                            color: Color(0xff913aff),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xxs),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6개월 구독 약정시',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '1년 구독 약정시',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '2년 구독 약정시',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xl),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '매월 35,800원',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '매월 24,800원',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '매월 14,800원',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '단일 상품 대비',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 20,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        '최대 30% 절약',
                        style: TextStyle(
                          color: white,
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xs),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '약정 기간 내 해지시 위약금 발생',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildType1_unSelect() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: InkWell(
        onTap: () {
          setState(() {
            selectType = 0;
          });
        },
        child: Container(
          // padding: const EdgeInsets.only(left: spacing_m, right: 0),
          width: Get.mediaQuery.size.width,
          height: 280,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: grey_2),
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                offset: Offset(4, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: spacing_m),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '케어 솔루션 패키지 정기구독',
                      style: TextStyle(
                        color: Color(0xff1d1d1d),
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Expanded(child: SizedBox(width: 1)),
                    Icon(
                      LineIcons.checkCircle,
                      color: grey_2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.only(left: spacing_m, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(LineIcons.check, color: primary, size: 10),
                        SizedBox(width: spacing_xxs),
                        Text(
                          '상품구성 : ',
                          style: TextStyle(
                            color: Color(0xff913aff),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xxs),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '플리닉 싱글 플라즈마 디바이스 제공 - 첫달 1회',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '맞춤형 화장품 1종(20ml) - 매월 1회',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '맞춤형 마스크팩 5종 - 매월 1회',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.only(left: spacing_m, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(LineIcons.check, color: primary, size: 10),
                        SizedBox(width: spacing_xxs),
                        Text(
                          '구독가격 : ',
                          style: TextStyle(
                            color: Color(0xff913aff),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xxs),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6개월 구독 약정시',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '1년 구독 약정시',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '2년 구독 약정시',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: spacing_xl),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '매월 35,800원',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '매월 24,800원',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_xxs),
                        Text(
                          '매월 14,800원',
                          style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_s),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '단일 상품 대비',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 20,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        '최대 30% 절약',
                        style: TextStyle(
                          color: white,
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xs),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_m),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '약정 기간 내 해지시 위약금 발생',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
