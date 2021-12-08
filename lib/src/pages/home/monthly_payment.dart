import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/component/plinic_dialog_one_button.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/pages/subscribe/subscribe_manage.dart';
import 'package:plinic2/src/pages/tabs/tabs.dart';

enum Monthly { MONTH6, MONTH12, MONTH24 }
enum PAYTYPE { MOBILE, CREDIT, BANK }

class MonthlyPayment extends StatefulWidget {
  MonthlyPayment({Key? key}) : super(key: key);

  @override
  _MonthlyPaymentState createState() => _MonthlyPaymentState();
}

class _MonthlyPaymentState extends State<MonthlyPayment> {
  bool allCheck = true;
  bool check1 = true;
  bool check2 = true;
  bool check3 = true;

  Monthly _month = Monthly.MONTH24;
  PAYTYPE _paytype = PAYTYPE.CREDIT;
  var amount = '14,800원';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('구독 결제하기'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: spacing_xxl2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                'STEP 2',
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_m),
            buildType1_select(),
            SizedBox(height: spacing_l),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('결제 옵션을 선택해 주세요.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_xl),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('약정기간 선택',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: spacing_xs, right: spacing_xxl2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Radio(
                          activeColor: primary,
                          value: Monthly.MONTH6,
                          groupValue: _month,
                          onChanged: (Monthly? value) {
                            setState(() {
                              _month = value!;
                              amount = '35,800원';
                            });
                          },
                        ),
                      ),
                      Text('6개월',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: primary,
                        value: Monthly.MONTH12,
                        groupValue: _month,
                        onChanged: (Monthly? value) {
                          setState(() {
                            _month = value!;
                            amount = '24,800원';
                          });
                        },
                      ),
                      Text('1년',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: primary,
                        value: Monthly.MONTH24,
                        groupValue: _month,
                        onChanged: (Monthly? value) {
                          setState(() {
                            _month = value!;
                            amount = '14,800원';
                          });
                        },
                      ),
                      Text('2년',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Divider(thickness: 1, height: 0, color: grey_3),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('월 구독금액',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  Text(amount,
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('구독 해지 위약금',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  Text('275,000원',
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
            SizedBox(height: spacing_xl),
            Divider(thickness: 8, height: 0, color: grey_3),
            SizedBox(height: spacing_l),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('결제수단 선택',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: spacing_xs, right: spacing_xxl2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Radio(
                          activeColor: primary,
                          value: PAYTYPE.MOBILE,
                          groupValue: _paytype,
                          onChanged: (PAYTYPE? value) {
                            setState(() {
                              _paytype = value!;
                            });
                          },
                        ),
                      ),
                      Text('휴대폰',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: primary,
                        value: PAYTYPE.CREDIT,
                        groupValue: _paytype,
                        onChanged: (PAYTYPE? value) {
                          setState(() {
                            _paytype = value!;
                          });
                        },
                      ),
                      Text('신용카드',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: primary,
                        value: PAYTYPE.BANK,
                        groupValue: _paytype,
                        onChanged: (PAYTYPE? value) {
                          setState(() {
                            _paytype = value!;
                          });
                        },
                      ),
                      Text('무통장',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Divider(color: grey_3, height: 0),
            SizedBox(height: spacing_xl),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('구독서비스를 이용하시려면, 아래 약관에 동의하셔야 합니다.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (allCheck) {
                            allCheck = false;
                            check1 = false;
                            check2 = false;
                            check3 = false;
                          } else {
                            allCheck = true;
                            check1 = true;
                            check2 = true;
                            check3 = true;
                          }
                        });
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: allCheck == true
                          ? Icon(LineIcons.checkCircle,
                              color: primary, size: 24)
                          : Icon(LineIcons.checkCircle,
                              color: grey_2, size: 24)),
                  SizedBox(width: spacing_xs),
                  Text('전체동의',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Divider(color: grey_3, height: 0),
            SizedBox(height: spacing_s),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            //   child: ListTile(
            //     horizontalTitleGap: -10,
            //     contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            //     leading: Icon(LineIcons.checkCircle, color: primary, size: 18),
            //     title: Text('구독박스 이용 약관 (필수)',
            //         style: TextStyle(
            //           fontFamily: 'NotoSansKR',
            //           color: black,
            //           fontSize: 14,
            //           fontWeight: FontWeight.w400,
            //           fontStyle: FontStyle.normal,
            //         )),
            //     trailing: Icon(LineIcons.angleRight, size: 18, color: black),
            //   ),
            // ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          setState(() {
                            check1 = !check1;
                          });
                        },
                        child: check1
                            ? Icon(LineIcons.checkCircle,
                                color: primary, size: 16)
                            : Icon(LineIcons.checkCircle,
                                color: grey_2, size: 16),
                      ),
                      SizedBox(width: spacing_xs),
                      Expanded(
                        child: Text('구독박스 이용 약관 (필수)',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      Icon(LineIcons.angleRight, size: 18),
                    ],
                  ),
                ),
                SizedBox(height: spacing_m),
                Divider(color: grey_3, height: 0),
                SizedBox(height: spacing_m),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          setState(() {
                            check2 = !check2;
                          });
                        },
                        child: check2
                            ? Icon(LineIcons.checkCircle,
                                color: primary, size: 16)
                            : Icon(LineIcons.checkCircle,
                                color: grey_2, size: 16),
                      ),
                      SizedBox(width: spacing_xs),
                      Expanded(
                        child: Text('자동결제 이용 약관(필수)',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      Icon(LineIcons.angleRight, size: 18),
                    ],
                  ),
                ),
                SizedBox(height: spacing_m),
                Divider(color: grey_3, height: 0),
                SizedBox(height: spacing_m),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            check3 = !check3;
                          });
                        },
                        child: check3
                            ? Icon(LineIcons.checkCircle,
                                color: primary, size: 16)
                            : Icon(LineIcons.checkCircle,
                                color: grey_2, size: 16),
                      ),
                      SizedBox(width: spacing_xs),
                      Expanded(
                        child: Text('개인정보 취급방침(필수)',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      Icon(LineIcons.angleRight, size: 18),
                    ],
                  ),
                ),
                SizedBox(height: spacing_m),
                Divider(color: grey_3, height: 0),
                SizedBox(height: spacing_m),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: Get.mediaQuery.size.width, height: 60),
              child: ElevatedButton(
                style: ButtonStyle(
                    // side: MaterialStateProperty.all(BorderSide(color: grey_2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                    elevation: MaterialStateProperty.all(0.0),
                    backgroundColor: MaterialStateProperty.all(primary)),
                onPressed: () async {
                  if (check1 && check2 && check3) {
                    await showAnimatedDialog(
                      animationType: DialogTransitionType.none,
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return PlinicDialogTwoButton(
                          button1Text: '구독 관리 확인하러 가기',
                          button2Text: '홈으로 이동하기',
                          title: '결제 완료',
                          content: '해당 정기구독에 대한\n결제가 완료 되었습니다.',
                          button1Click: () {
                            Get.to(
                              SubscribeManage(isFirstPay: true),
                              transition: Transition.native,
                            );
                          },
                          button2Click: () {
                            Get.offAll(() => Tabs(),
                                transition: Transition.native);
                          },
                        );
                      },
                    );
                  } else {
                    await showAnimatedDialog(
                      animationType: DialogTransitionType.none,
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return PlinicDialogOneButton(
                          buttonText: '확인',
                          buttonClick: () {
                            Get.back();
                          },
                          title: '알림',
                          content: '필수 약관을 동의해주세요',
                        );
                      },
                    );
                  }
                },
                child: Text('결제하기',
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
          height: 270,
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
                          '맞춤형 마스크��� 5종 - 매월 1회',
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
