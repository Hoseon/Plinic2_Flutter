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
          selectType == 1 ? buildType2_select() : buildType2_unSelect(),
          SizedBox(height: 48),
          selectType == 2 ? buildType3_select() : buildType3_unSelect(),
          SizedBox(height: spacing_xl),
          nextButton(),
        ],
      ),
    );
  }

  Widget nextButton() {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: Get.mediaQuery.size.width, height: 60),
      child: ElevatedButton(
        style: ButtonStyle(
            // side: MaterialStateProperty.all(BorderSide(color: grey_2)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(primary)),
        onPressed: () {
          Get.to(PayStep1Page(),
              transition: Transition.native, arguments: selectType);
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
    );
  }

  Widget buildType3_select() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: InkWell(
        onTap: () {
          print('b');
        },
        child: Container(
          width: Get.mediaQuery.size.width,
          height: 358,
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
                      '플리닉 화장품박스 V21',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 16,
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
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '상품구성 ',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '피부 부스터 25ml - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '전용 마스크 팩 4P - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '구독 약정가격',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 부스터 : 45,000원(정가) x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '1,080,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 마스크 팩 4P : 12,000원 x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '280,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '배송비 : 3,000원 x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '72,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding:
                    const EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: grey_2,
                  ),
                ),
              ),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('2,032,000원 / 24개월 = 84,600원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('구독 신청 시 매 월 19,800원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxl2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('※ 플리닉 구독박스로 월 64,800원 할인혜택 받기',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary_dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildType3_unSelect() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: InkWell(
        onTap: () {
          setState(() {
            selectType = 2;
          });
        },
        child: Container(
          // padding: const EdgeInsets.only(left: spacing_m, right: 0),
          width: Get.mediaQuery.size.width,
          height: 358,
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
                      '플리닉 화장품박스 V21',
                      style: TextStyle(
                        color: Color(0xff1d1d1d),
                        fontSize: 16,
                        fontFamily: 'NotoSans',
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
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '상품구성 ',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '피부 부스터 25ml - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '전용 마스크 팩 4P - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '구독 약정가격',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 부스터 : 45,000원(정가) x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '1,080,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 마스크 팩 4P : 12,000원 x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '280,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '배송비 : 3,000원 x 24',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      '72,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding:
                    const EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: grey_2,
                  ),
                ),
              ),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('2,032,000원 / 24개월 = 84,600원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('구독 신청 시 매 월 19,800원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxl2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('※ 플리닉 구독박스로 월 64,800원 할인혜택 받기',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary_dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildType2_select() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
      child: InkWell(
        onTap: () {
          print('b');
        },
        child: Container(
          width: Get.mediaQuery.size.width,
          height: 400,
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
                      '플리닉 듀얼박스 V21',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 16,
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
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '상품구성 ',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '플리닉 듀얼 플라즈마 디바이스 - 첫 1회 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '피부 부스터 25ml - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '전용 마스크 팩 4P - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '구독 약정가격',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '플리닉 듀얼 : 600,000원(정가) x 1',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '600,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 부스터 : 45,000원(정가) x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '1,080,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 마스크 팩 4P : 12,000원 x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '280,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '배송비 : 3,000원 x 24',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      '72,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding:
                    const EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: grey_2,
                  ),
                ),
              ),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('2,032,000원 / 24개월 = 84,600원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('구독 신청 시 매 월 19,800원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxl2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('※ 플리닉 구독박스로 월 64,800원 할인혜택 받기',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary_dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildType2_unSelect() {
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
          height: 400,
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
                      '플리닉 듀얼박스 V21',
                      style: TextStyle(
                        color: Color(0xff1d1d1d),
                        fontSize: 16,
                        fontFamily: 'NotoSans',
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
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '상품구성 ',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '플리닉 듀얼 플라즈마 디바이스 - 첫 1회 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '피부 부스터 25ml - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '전용 마스크 팩 4P - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '구독 약정가격',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '플리닉 듀얼 : 600,000원(정가) x 1',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '600,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 부스터 : 45,000원(정가) x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '1,080,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 마스크 팩 4P : 12,000원 x 24',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '280,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '배송비 : 3,000원 x 24',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      '72,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding:
                    const EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: grey_2,
                  ),
                ),
              ),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('2,032,000원 / 24개월 = 84,600원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('구독 신청 시 매 월 19,800원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxl2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('※ 플리닉 구독박스로 월 64,800원 할인혜택 받기',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary_dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
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
          width: Get.mediaQuery.size.width,
          height: 400,
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
                      '플리닉 싱글박스 V21',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: black,
                        fontSize: 16,
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
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '상품구성 ',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '플리닉 싱글 플라즈마 디바이스 - 첫 1회 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '피부 부스터 25ml - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '전용 마스크 팩 4P - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '구독 약정가격',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '플리닉 싱글 : 312,000원(정가) x 1',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '312,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 부스터 : 45,000원(정가) x 12',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '540,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 마스크 팩 4P : 12,000원 x 12',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '144,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '배송비 : 3,000원 x 12',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      '36,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding:
                    const EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: grey_2,
                  ),
                ),
              ),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('1,068,000원 / 12개월 = 89,000원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('구독 신청 시 매 월 19,800원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxl2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('※ 플리닉 구독박스로 월 69,200원 할인혜택 받기',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary_dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
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
          height: 400,
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
                      '플리닉 싱글박스 V21',
                      style: TextStyle(
                        color: Color(0xff1d1d1d),
                        fontSize: 16,
                        fontFamily: 'NotoSans',
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
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '상품구성 ',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '플리닉 싱글 플라즈마 디바이스 - 첫 1회 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '피부 부스터 25ml - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_xxl2),
                alignment: Alignment.centerLeft,
                child: Text(
                  '전용 마스크 팩 4P - 매 월 1개 제공',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(LineIcons.check, color: primary, size: 10),
                    SizedBox(width: spacing_xxs),
                    Text(
                      '구독 약정가격',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '플리닉 싱글 : 312,000원(정가) x 1',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '312,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 부스터 : 45,000원(정가) x 12',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '540,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'V21. 마스크 팩 4P : 12,000원 x 12',
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: grey_1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Text(
                      '144,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_xxs),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '배송비 : 3,000원 x 12',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      '36,000원',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(height: spacing_l),
              Padding(
                padding:
                    const EdgeInsets.only(left: spacing_xxl2, right: spacing_m),
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: grey_2,
                  ),
                ),
              ),
              SizedBox(height: spacing_s),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('1,068,000원 / 12개월 = 89,000원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xs),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('구독 신청 시 매 월 19,800원',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xxl2),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing_m),
                alignment: Alignment.centerRight,
                child: Text('※ 플리닉 구독박스로 월 69,200원 할인혜택 받기',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      color: primary_dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
