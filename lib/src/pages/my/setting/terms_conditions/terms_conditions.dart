import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class TermsConditionPage extends StatelessWidget {
  const TermsConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar('이용약관'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Column(
          children: [
            SizedBox(
              height: spacing_m,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '서비스 이용약관',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_s),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '제 1 장 총 칙',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
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
                  Text(
                    '제 1 조 (목적)',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Text(
                "이 이용약관(이하 '약관')은 플리닉(이하 '회사')과 이용 고객(이하 '회원')간에 회사가 제공하는 플리닉 앱 서비스(이하 '서비스')의 가입조건 및 이용에 관한 제반 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.",
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xxl2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Text(
                    '제2조 (정의)',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing_m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Text(
                "1. \"플리닉\"이란 회사가 재화 또는 용역(이하 \"재화 등\" 이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자 의미로도 사용합니다.\n\n2. \"이용자\"란 \"플리닉\"에 접속하여 이 약관에 따라 \"플리닉\"이 제공하는 서비스를 받는 회원을 말합니다.\n\n3. '회원'이라 함은 \"플리닉\"에 회원등록을 한 자로서, 계속적으로 \"플리닉\"이 제공하는 서비스를 이용할 수 있는 자를 말합니다.\n\n4. \"휴면회원\" 이라 함은 \"플리닉\"의 '회원'중 1년 이상 서비스 이용 기록이 없는 자를 말합니다. 휴면 회원은 \"플리닉\"의 정책에 다라 서비스 이용이 제한 될 수 있으며 , 다시 서비스를 이용하기 위하여는 거래 안전 등을 위하여 \"플리닉\"이 정하는 본인 확인 절차등을 이행하여야 올바른 '회원'의 서비스를 이용할 수 있습니다.",
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(height: spacing_xl,)
          ],
        ),
      ),
    );
  }
}
