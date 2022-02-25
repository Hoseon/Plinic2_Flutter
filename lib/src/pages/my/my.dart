import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/common_text.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/home/home_main.dart';
import 'package:plinic2/src/pages/my/address/address_manage.dart';
import 'package:plinic2/src/pages/my/alarm/my_alarm.dart';
import 'package:plinic2/src/pages/my/notice/notice.dart';
import 'package:plinic2/src/pages/my/setting/faq/faq.dart';
import 'package:plinic2/src/pages/my/setting/setting.dart';
import 'package:plinic2/src/pages/my/show_profile.dart';
import 'package:plinic2/src/pages/my/my_test.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
    KakaoContext.clientId = 'f61905ec86a576b4a4b9b90af0946fb2';
  }

  @override
  Widget build(BuildContext context) {
    var myProfile = ProfileController.to.myProfile.value; //아바타 이미지 가져옴
    return Column(
      children: [
        SizedBox(height: 46),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
          child: boldTextCommon('마이페이지', 24),
        ),
        SizedBox(height: 33),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Row(
            children: [
              Obx(
                () => Container(
                    alignment: Alignment.centerLeft,
                    child: urlProfileImage(
                        ProfileController.to.myProfile.value.avataUrl)),
              ),
              SizedBox(width: 16),
              InkWell(
                onTap: () {
                  Get.to(() => ShowProfilePage(),
                      transition: Transition.native);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => boldTextCommon(
                            '${ProfileController.to.myProfile.value.nickname}님',
                            16)),
                        Icon(LineIcons.angleRight, size: 15)
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(myProfile.email.toString(),
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: Color(0xff828282),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        ListTile(
          dense: false,
          contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
          leading: Text(
            '카카오채널 문의하기',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: Color(0xff1d1d1d),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          trailing: Icon(LineIcons.angleRight),
          onTap: () async {
            await requestFriends();
          },
        ),
        buildMenuTile('FAQ', FaqPage()),
        buildMenuTile('배송정보관리', AddressManagePage()),
        buildMenuTile('알림관리', MyAlarmPage()),
        buildMenuTile('공지사항', NoticePage()),
        buildMenuTile('설정', SettingPage()),
      ],
    );
  }

  ListTile buildMenuTile(String menuTitle, Widget className) {
    return ListTile(
      dense: false,
      contentPadding: EdgeInsets.symmetric(horizontal: spacing_xl),
      leading: Text(
        menuTitle,
        style: TextStyle(
          fontFamily: 'NotoSans',
          color: Color(0xff1d1d1d),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      trailing: Icon(LineIcons.angleRight),
      onTap: () {
        Get.to(className,
            transition: Transition.native); //페이지 이동 기능 추가 2022-02-05
      },
    );
  }

  Widget urlProfileImage(String? profileUrl) {
    return profileUrl == null || profileUrl.isEmpty
        ? Image.asset('assets/images/profile.png')
        : Container(
            width: 54,
            height: 54,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                ProfileController.to.myProfile.value.avataUrl.toString(),
              ),
            ),
          );
  }

  Future<void> requestFriends() async {
    try {
      var kakaoChatUri = await TalkApi.instance.channelChatUrl('_PMxjxjxb');
      var canLaunched = await canLaunch(kakaoChatUri.toString());
      print('canLaunched: ${canLaunched.toString()}');
      await Future.delayed(Duration(milliseconds: 500));
      var succeeded = await launch(kakaoChatUri.toString(),
          forceSafariVC: false, universalLinksOnly: true);
      if (!succeeded) {
        await launch(kakaoChatUri.toString(), forceSafariVC: true);
      }
      print(kakaoChatUri);

      // do anything you want with user instance
    } on KakaoAuthException catch (e) {
      print('카카오 에러1 : $e');
      // if (e.code == ApiErrorCause.INVALID_TOKEN) { // access token has expired and cannot be refrsehd. access tokens are already cleared here
      //   Navigator.of(context).pushReplacementNamed('/login'); // redirect to login page
      // } else if (e.code == ApiErrorCause.INSUFFICIENT_SCOPE) {
      //   // If code is ApiErrorCause.INSUFFICIENT_SCOPE, error instance will contain missing required scopes.
      //   // If your Kakao Flutter SDK version is 0.7.0 or higher, An additional consent window will appear automatically.
      // }
    } catch (e) {
      print('카카오 에러2 : $e');
      // other api or client-side errors
    }
  }
}
