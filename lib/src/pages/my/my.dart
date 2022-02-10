import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/common_text.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/home/home_main.dart';
import 'package:plinic2/src/pages/my/show_profile.dart';
import 'package:plinic2/src/pages/my/my_test.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

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
        buildMenuTile('카카오채널 문의하기', MyTestPage()),
        buildMenuTile('FAQ', HomeMainPage()),
        buildMenuTile('배송정보관리', HomeMainPage()),
        buildMenuTile('알림관리', HomeMainPage()),
        buildMenuTile('공지사항', HomeMainPage()),
        buildMenuTile('설정', HomeMainPage()),
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
        Get.to(className); //페이지 이동 기능 추가 2022-02-05
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
}
