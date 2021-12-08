import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/tabs_controller.dart';
import 'package:plinic2/src/pages/subscribe/subscribe_cancel.dart';
import 'package:plinic2/src/pages/tabs/tabs.dart';
import 'package:shimmer/shimmer.dart';

class SubscribeManage extends StatefulWidget {
  SubscribeManage({Key? key, this.isFirstPay}) : super(key: key);
  bool? isFirstPay = false;

  @override
  _SubscribeManageState createState() => _SubscribeManageState();
}

class _SubscribeManageState extends State<SubscribeManage> {
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
    return WillPopScope(
      onWillPop: () async {
        await Get.offAll(() => Tabs(), transition: Transition.native);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: white,
            elevation: 0.3,
            centerTitle: true,
            title: Text(
              '구독내용',
              style: TextStyle(
                color: Color(0xff1d1d1d),
                fontSize: 16,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            leading: widget.isFirstPay == false
                ? IconButton(
                    icon: Icon(LineIcons.arrowLeft, color: black),
                    onPressed: () {
                      Get.back();
                    })
                : SizedBox(),
            actions: [
              if (widget.isFirstPay == true)
                IconButton(
                    icon: Icon(LineIcons.home, color: black, size: 30),
                    onPressed: () {
                      TabsController.to.changePageIndex(0);
                      Get.offAll(() => Tabs(), transition: Transition.native);
                    })
            ]),
        backgroundColor: white,
        // body: buildBody(context),
        body: completeLoad ? buildBody(context) : buildLoading(context),
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: spacing_xxl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildshimmer(112, 24, grey_2),
                _buildshimmer(52, 24, grey_3),
              ],
            ),
          ),
          SizedBox(height: spacing_l),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Container(width: 81, child: _buildshimmer(52, 16, grey_3)),
                Text('|', style: TextStyle(color: grey_3)),
                SizedBox(width: spacing_xs),
                _buildshimmer(152, 16, grey_3)
              ],
            ),
          ),
          SizedBox(height: spacing_xs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Container(width: 81, child: _buildshimmer(72, 16, grey_3)),
                Text('|', style: TextStyle(color: grey_3)),
                SizedBox(width: spacing_xs),
                _buildshimmer(72, 16, grey_3)
              ],
            ),
          ),
          SizedBox(height: spacing_l),
          Divider(height: 1, color: grey_3),
          SizedBox(height: spacing_l),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmerCircle(32, 32, grey_3),
                SizedBox(width: spacing_xs),
                _buildshimmer(52, 16, grey_3),
                Expanded(child: SizedBox(width: 1)),
                Container(
                  width: 77,
                  height: 32,
                  decoration: BoxDecoration(
                      color: grey_3,
                      border: Border.all(color: grey_2),
                      borderRadius: BorderRadius.circular(4)),
                )
              ],
            ),
          ),
          SizedBox(height: spacing_xl),
          Divider(height: 10, thickness: 8, color: grey_3),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(112, 24, grey_2),
          ),
          SizedBox(height: spacing_l),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(72, 16, grey_3),
                SizedBox(width: 46),
                _buildshimmer(72, 16, grey_3),
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(72, 16, grey_3),
                SizedBox(width: 46),
                _buildshimmer(72, 16, grey_3),
              ],
            ),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(256, 16, grey_3),
          ),
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
                width: Get.mediaQuery.size.width,
                height: 32,
                decoration: BoxDecoration(
                    border: Border.all(color: grey_2),
                    borderRadius: BorderRadius.circular(4),
                    color: grey_3)),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildshimmer(112, 24, grey_2),
                _buildshimmer(52, 24, grey_3),
              ],
            ),
          ),
          SizedBox(height: spacing_l),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(72, 20, grey_3),
                SizedBox(width: 44),
                _buildshimmer(108, 20, grey_3)
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(72, 20, grey_3),
                SizedBox(width: 44),
                _buildshimmer(108, 20, grey_3)
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(72, 20, grey_3),
                SizedBox(width: 44),
                _buildshimmer(108, 20, grey_3)
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(88, 20, grey_3),
                SizedBox(width: spacing_xxl),
                _buildshimmer(108, 20, grey_3)
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildshimmer(88, 20, grey_3),
                SizedBox(width: spacing_xxl),
                Column(
                  children: [
                    _buildshimmer(196, 16, grey_3),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(196, 16, grey_3),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(88, 20, grey_3),
                SizedBox(width: spacing_xxl),
                _buildshimmer(36, 20, grey_3)
              ],
            ),
          ),
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

  Shimmer _buildshimmerCircle(double width, double height, color) {
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
              shape: BoxShape.circle,
              color: grey_3,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: spacing_xxl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '자동결제 정보',
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 18,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              InkWell(
                onTap: () {
                  print('구독해지 클릭 됨');
                  showModalBottomSheet(
                    enableDrag: true,
                    isDismissible: false,
                    backgroundColor: Colors.transparent,
                    // barrierColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => buildSheet(context),
                  );
                },
                child: Text(
                  '구독해지',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff828282),
                    fontSize: 14,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Container(
                width: 80,
                child: Text('구독기간',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('|', style: TextStyle(color: grey_1)),
              SizedBox(width: spacing_xs),
              Text('2021.09.17 ~ 2023.10.16',
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
                width: 80,
                child: Text('다음 결제일',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('|', style: TextStyle(color: grey_1)),
              SizedBox(width: spacing_xs),
              Text('2021.10.17',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(color: grey_2, height: 0),
        ),
        SizedBox(height: 21),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primary),
                child: Icon(LineIcons.wallet, color: white, size: 20),
              ),
              SizedBox(width: spacing_xs),
              Expanded(
                child: Text('자동결제',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              InkWell(
                onTap: () {
                  print('카드관리 클릭');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 77,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: primary),
                      color: Colors.transparent),
                  child: Text('카드관리',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_xl),
        Divider(thickness: 8, color: grey_3, height: 1),
        SizedBox(height: spacing_xl),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('다음 발송',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Container(
                width: 117,
                child: Text('배송 예정일',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('2021.10.18',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Container(
                width: 117,
                child: Text('도착 예정일',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('2021.10.19',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_l),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          alignment: Alignment.centerLeft,
          child: Text('-배송업체의 사정에 따라 배송이 지연될 수 있습니다.',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: grey_1,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ),
        SizedBox(height: spacing_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            onTap: () {
              print('배송 조회 클릭 됨');
            },
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: primary),
                borderRadius: BorderRadius.circular(4),
                color: Colors.transparent,
              ),
              child: Text(
                '배송조회',
                style: TextStyle(
                  color: primary,
                  fontSize: 12,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_xl),
        Divider(
          thickness: 8,
          color: grey_3,
          height: 5,
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('구독 상세 정보',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              InkWell(
                onTap: () {
                  print('결제내역 클릭 됨');
                },
                child: Text('결제내역',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
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
        SizedBox(height: spacing_l),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Container(
                width: 115,
                child: Text('구독 상품명',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('케어 솔루션 패키지',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Container(
                width: 115,
                child: Text('최초 구매일',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('2021.09.17',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Container(
                width: 115,
                child: Text('수취인',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('홍길동',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Container(
                width: 115,
                child: Text('수취인 연락처',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('01012345678',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 115,
                child: Text('배송지 정보',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                width: Get.mediaQuery.size.width * 0.53,
                child: Text(
                  '서울특별시 송파구 송파대로 453 레이크빌 빌딩 402호',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: spacing_m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Container(
                width: 115,
                child: Text('현재 구독 회차',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Text('1회차',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
        SizedBox(height: spacing_xxl2),
      ],
    ));
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.back(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet(context) => makeDismissible(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.only(top: spacing_xl),
          // padding: EdgeInsets.symmetric(horizontal: 0, vertical: spacing_xxl2),
          child: Column(
            // controller: controller,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(LineIcons.times))
                  ],
                ),
              ),
              SizedBox(height: spacing_m),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                alignment: Alignment.center,
                child: Text('해지 전 확인해 주세요!',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              SizedBox(height: spacing_xl),
              Text('지금 해지하시면,\n구독 기간에 따른 약정위약금이 발생합니다.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(height: spacing_xxl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(grey_2),
                          minimumSize: MaterialStateProperty.all(
                              Size(Get.mediaQuery.size.width * 0.427, 42))),
                      onPressed: () {
                        print('해지하기 클릭됨');
                        Get.back();
                        Get.to(() => SubScribeCancelPage(),
                            transition: Transition.native);
                      },
                      child: Text('해지하기',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0.0),
                            backgroundColor: MaterialStateProperty.all(primary),
                            minimumSize: MaterialStateProperty.all(
                                Size(Get.mediaQuery.size.width * 0.427, 42))),
                        onPressed: () {
                          print('구독 유지하기 클릭됨');
                          Get.back();
                        },
                        child: Text('구독 유지하기',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))),
                    // Container(
                    //     width: Get.mediaQuery.size.width * 0.427,
                    //     height: 42,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(4),
                    //       color: grey_2,

                    // InkWell(
                    //   onTap: () {
                    //     print('aa');
                    //   },
                    //   splashColor: primary,
                    //   child: Container(
                    //     width: Get.mediaQuery.size.width * 0.427,
                    //     height: 42,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(4),
                    //       color: grey_2,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(height: spacing_xl)
            ],
          ),
        ),
      );
}
