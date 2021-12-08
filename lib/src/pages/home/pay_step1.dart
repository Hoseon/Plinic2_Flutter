import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';
import 'package:plinic2/src/pages/home/monthly_payment.dart';
import 'package:plinic2/src/pages/home/pay_step2.dart';

class PayStep1Page extends StatelessWidget {
  const PayStep1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('구독서비스'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: spacing_xxl),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                'STEP 1',
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '구독하실 상품정보를 확인해주세요.',
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 20,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Image.asset('assets/images/home/subscribe-box.png',
                  width: Get.mediaQuery.size.width, fit: BoxFit.fitWidth),
            ),
            SizedBox(height: spacing_l),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '케어 솔루션 패키지 정기구독',
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 16,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: spacing_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
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
                ),
                SizedBox(height: spacing_l),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Divider(height: 0),
                ),
                SizedBox(height: spacing_m),
                InkWell(
                  onTap: () {
                    Get.to(PayStep2Page(), transition: Transition.native);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '상품 상세 정보',
                          style: TextStyle(
                            color: Color(0xff1d1d1d),
                            fontSize: 16,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Icon(LineIcons.angleRight, size: 20)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spacing_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Divider(height: 0),
                ),
                SizedBox(height: spacing_xl),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.63),
                      ),
                      SizedBox(width: spacing_xxs),
                      Container(
                        width: Get.mediaQuery.size.width * 0.8,
                        child: Text(
                          '결제일 기준 3일 전에 알림 문자를 보내드립니다.',
                          style: TextStyle(
                              color: Color(0xff828282),
                              fontSize: 12,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              height: 1.63),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.63),
                      ),
                      SizedBox(width: spacing_xxs),
                      Container(
                        width: Get.mediaQuery.size.width * 0.8,
                        child: Text(
                          '1개월 단위로 자동결제 됩니다.',
                          style: TextStyle(
                              color: Color(0xff828282),
                              fontSize: 12,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              height: 1.63),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.63),
                      ),
                      SizedBox(width: spacing_xxs),
                      Container(
                        width: Get.mediaQuery.size.width * 0.8,
                        child: Text(
                          '약정기간이 존재하는 구독 서비스 해제 시 약정위약금이 \n발생될 수 있습니다.',
                          style: TextStyle(
                              color: Color(0xff828282),
                              fontSize: 12,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              height: 1.63),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.63),
                      ),
                      SizedBox(width: spacing_xxs),
                      Container(
                        width: Get.mediaQuery.size.width * 0.8,
                        child: Text(
                          '자동결제를 해지하실 수 있으며, 해지 시 다음 결제일 부터\n결제되지 않습니다.',
                          style: TextStyle(
                              color: Color(0xff828282),
                              fontSize: 12,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              height: 1.63),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(
                            color: Color(0xff828282),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.63),
                      ),
                      SizedBox(width: spacing_xxs),
                      Container(
                        width: Get.mediaQuery.size.width * 0.8,
                        child: Text(
                          '(이미 결제된 경우 환불이 불가능하며, 남은기간 동안\n구독 자격이 유지됩니다.)',
                          style: TextStyle(
                              color: Color(0xff828282),
                              fontSize: 12,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              height: 1.63),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing_xl),
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
                onPressed: () {
                  Get.to(MonthlyPayment(), transition: Transition.native);
                },
                child: Text('구독 결제 하러 가기',
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
}
