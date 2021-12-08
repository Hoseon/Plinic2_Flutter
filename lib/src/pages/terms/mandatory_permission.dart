import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/custom_appbar.dart';

class MandatoryPermissionPage extends StatelessWidget {
  const MandatoryPermissionPage({Key? key}) : super(key: key);

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
            child: Text(
              '■ 필수 접근 권한\n',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text(
              '• 근처 블루투스 기기 \n: 플리닉 디바이스와 연결을 위한 접근\r\n\r\n• Wi-Fi 검색 및 블루투스 검색 \n: 플리닉 디바이스와 연결을 위한 접근\r\n\r\n•  위치\n: 플리닉 디바이스 검색을 위한 접근\r\n\n',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 14,
                height: 1.63,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
