import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class TermsMarketingPage extends StatelessWidget {
  const TermsMarketingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppbar('마케팅 활용 동의'),
      body: Column(
        children: [
          SizedBox(height: spacing_xxl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text(
                '■ “플리닉\"은 회원가입 시 수집된 개인정보를 이용하여 탈퇴 시까지 각종 서비스, 제품 및 유용한 컨텐츠에 대해서 홍보, 구매권유, 프로모션, 이벤트 안내 등의 목적으로 본인에게 정보, 광고를 전화, 문자메시지, 카카오톡, 이메일, 우편 및 앱 푸시 등의 방법으로 전달합니다.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  height: 1.63,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          ),
          SizedBox(height: spacing_xl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text(
              '■ “플리닉\"은 구매, 배송, 정기 구독 등 의무적으로 안내되어야 하는 정보성 내용은 수신동의 여부와 무관하게 제공됩니다.',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Color(0xff000000),
                fontSize: 14,
                height: 1.63,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text(
              '■ 개인정보보호법 제22조 제4항에 의해 동의하지 않을 권리가 있으며, 동의하지 않는 경우에도 회원 가입 및 상품 구매는 가능합니다.',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Color(0xff000000),
                fontSize: 14,
                height: 1.63,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
