import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class PayStep2Page extends StatelessWidget {
  const PayStep2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('맞춤 솔루션 상세정보'),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/home/solution-box-2.png',
              width: Get.mediaQuery.size.width,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 44),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '플리닉 플라즈마 디바이스 제공',
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xs),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '제 4의 물질 상태인 플라즈마로\n다양한 피부 균형 요소를 바로잡아드립니다.',
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 16,
                  height: 1.63,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Container(
                    width: 176,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: primary),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '피부세포 재생 및 활성화 촉진',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(width: spacing_xs),
                  Container(
                    width: 79,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: primary),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '살균 기능',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Container(
                    width: 115,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: primary),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '온열 마사지 기능',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(width: spacing_xs),
                  Container(
                    width: 162,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: primary),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '화장품 유효성분 흡수 촉진',
                      style: TextStyle(
                        color: Color(0xff913aff),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 47),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                '두번째, 피부타입 맞춤 화장품 제공 (월 1회)',
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xs),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text(
                  '플리닉 싱글 디바이스와 함께 \n효과를 높일 플리닉만의 앰플, 마스크팩 까지\n꼭 필요한 구성으로 선물처럼 보내드립니다.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 16,
                    height: 1.63,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('세번째,데일리 케어 전용 앱 제공',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_xs),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('지속적인 스킨케어를 도와드리기 위해 케어기록,커뮤니티,쇼핑까지 모두 제공해드립니다.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 16,
                    height: 1.63,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('네번째,연속 케어 이벤트 참여 가능',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_xs),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('매일 디바이스를 연동해서 사용하시면 \n피부도 좋아지고 덤으로 혜택도 받아가세요.',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 16,
                    height: 1.63,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_xxl)
          ],
        ),
      ),
    );
  }
}
