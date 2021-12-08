import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/intro/intro.dart';

class CheckPermission extends StatelessWidget {
  const CheckPermission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 44,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('플리닉 앱 권한 설정 안내',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Divider(
                thickness: 0.5,
              ),
              SizedBox(height: 20),
              Text(
                'ㆍPlinic앱 서비스 이용에 꼭 필요한  필수 접근 권한',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: primary_dark,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          buildComponent(
              'assets/images/mobile.svg', '기기 및 앱 기록', '앱 상태(버전) 확인'),
          SizedBox(height: 16),
          buildComponent('assets/images/user.svg', 'ID', '기기 식별 및 광고 트래킹'),
          SizedBox(height: 16),
          buildComponent(
              'assets/images/wifi.svg', 'WIFI 연결정보', '앱 이용 네트워크 연결체크'),
          SizedBox(height: 33),
          Text(
            'ㆍ선택 접근 권한은 해당 기능 사용 시 승인이 필요하\n 며, 승인하지 않아도  타 서비스 이용은 가능합니다.',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: primary_dark,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 24),
          buildComponent('assets/images/image.svg', '기기 및 앱 기록', '앱 상태(버전) 확인'),
          SizedBox(height: 16),
          buildComponent('assets/images/sms.svg', 'ID', '기기 식별 및 광고 트래킹'),
          SizedBox(height: 16),
          buildComponent(
              'assets/images/book.svg', 'WIFI 연결정보', '앱 이용 네트워크 연결체크'),
        ],
      ),
      bottomSheet: Container(
        width: Get.mediaQuery.size.width,
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.zero),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
          onPressed: () {
            Get.off(() => OnBoardingPage(), transition: Transition.fadeIn);
          },
          child: Text('네,확인했어요',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
      ),
    );
  }

  Widget buildComponent(String assetIcon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFf3f3f3)),
              ),
              SvgPicture.asset(assetIcon, width: 20),
            ],
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              Text(content,
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
