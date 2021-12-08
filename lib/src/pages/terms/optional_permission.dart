import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class OptionalPermissionPage extends StatelessWidget {
  const OptionalPermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppbar('서비스 이용 접근 권한'),
      body: Column(
        children: [
          SizedBox(height: spacing_xxl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text('■ 선택 접근 권한',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ),
          SizedBox(height: spacing_xxs),
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text(
                '접근 권한에 동의 하지 않아도 서비스 이용이\n가능합니다.\r\n\r\n•  파일 및 미디어\n: 커뮤니티 작성을 위한 갤러리/사진 접근\r\n\r\n•  푸시 알림\n: 구독 정보 및 마케팅 이벤트 알림',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 14,
                  height: 1.63,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          )
        ],
      ),
    );
  }
}
