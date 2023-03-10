import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/friends/invite_friend.dart';
import 'package:plinic2/src/pages/jjim/jjim.dart';
import 'package:plinic2/src/pages/my/address/address.dart';
import 'package:plinic2/src/pages/my/address/address_manage.dart';
import 'package:plinic2/src/pages/my/badge/badge.dart';
import 'package:plinic2/src/pages/my/cash/cash.dart';
import 'package:plinic2/src/pages/my/setting/faq/faq.dart';
import 'package:plinic2/src/pages/my/show_profile.dart';
import 'package:plinic2/src/pages/my/notice/notice.dart';
import 'package:plinic2/src/pages/my/post/my_post.dart';
import 'package:plinic2/src/pages/my/qna/qna.dart';
import 'package:plinic2/src/pages/my/setting/setting.dart';
import 'package:plinic2/src/pages/subscribe/subscribe_manage.dart';

class MyTestPage extends GetView<ProfileController> {
  const MyTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomSheet: _myBottom(),
      body: SingleChildScrollView(child: _buildBody()),
    );
  }

  Column _buildBody() {
    return Column(
      children: [
        SizedBox(height: 27),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: Get.mediaQuery.size.width * 0.090),
            // Image.asset('assets/images/profile.png'),
            controller.myProfile.value.avataUrl == null
                ? Image.asset('assets/images/profile.png')
                : Container(
                    width: 54,
                    height: 54,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          controller.myProfile.value.avataUrl.toString()),
                    ),
                  ),
            SizedBox(width: Get.mediaQuery.size.width * 0.043),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: grey_2,
                  onTap: () {
                    Get.to(() => ShowProfilePage(),
                        transition: Transition.fadeIn);
                  },
                  child: Text(
                    '${controller.myProfile.value.name} ???',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        height: 1.4),
                  ),
                ),
                SizedBox(height: Get.mediaQuery.size.height * 0.005),
                InkWell(
                  splashColor: grey_2,
                  onTap: () {
                    Get.to(() => ShowProfilePage(),
                        transition: Transition.fadeIn);
                  },
                  child: Text(
                    '???????????? ??????',
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        height: 1.4),
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: Get.mediaQuery.size.height * 0.045),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: grey_2,
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Column(
                children: [
                  Text(
                    '20',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff000000),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.005),
                  Text(
                    '????????????',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: grey_2,
              onTap: () {
                Get.toNamed('/reviews');
              },
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Text(
                    '32',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff000000),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.005),
                  Text(
                    '????????????',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: grey_2,
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Get.to(() => JJimPage(), transition: Transition.fadeIn);
              },
              child: Column(
                children: [
                  Text(
                    '17',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff000000),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: Get.mediaQuery.size.height * 0.005),
                  Text(
                    '?????????',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: Get.mediaQuery.size.height * 0.03),
        Divider(
          thickness: 14,
          color: grey_3,
        ),
        listViewBuild(),
        SizedBox(height: 150)
      ],
    );
  }

  Widget _myBottom() {
    return InkWell(
      onTap: () {
        Get.to(() => SubscribeManage(isFirstPay: false),
            transition: Transition.native);
      },
      child: Container(
          width: Get.mediaQuery.size.width,
          height: 100,
          // color: Colors.grey,
          child: Image.asset(
            'assets/images/mypage-banner-2-1.png',
            fit: BoxFit.cover,
          )),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: Icon(LineIcons.arrowLeft),
          color: Colors.black,
          onPressed: () {
            Get.back();
          }),
      actions: [
        IconButton(
          // icon: Icon(Icons.brightness_low),
          icon: Icon(LineIcons.cog),
          onPressed: () {
            Get.to(() => SettingPage(), transition: Transition.native);
          },
        )
      ],
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.3,
      title: AppbarTitle(title: '???????????????'),
    );
  }

  Widget listViewBuild() {
    return Column(
      children: [
        CustomListTile(LineIcons.coins, '??????', '11,789???', primaryColor,
            () => {Get.to(() => CashPage())}),
        CustomListTile(LineIcons.certificate, 'My??????', '???????????????',
            Color(0xFF27ae60), () => {Get.to(() => BadgePage())}),
        CustomListTile(LineIcons.listUl, '???????????????', '', Colors.black,
            () => {Get.to(() => MyPostPage())}),
        CustomListTile(LineIcons.truck, '???????????????', '', Colors.black,
            () => {Get.to(() => AddressManagePage())}),
        CustomListTile(LineIcons.userFriends, '????????????', '', Colors.black,
            () => {Get.to(() => InviteFriend())}),
        CustomListTile(LineIcons.questionCircle, 'FAQ', '', Colors.black,
            () => {Get.to(() => FaqPage())}),
        CustomListTile(LineIcons.questionCircle, '????????????', '', Colors.black,
            () => {Get.to(() => QnaPage(), transition: Transition.native)}),
        CustomListTile(LineIcons.bullhorn, '????????????', '', Colors.black,
            () => {Get.to(() => NoticePage(), transition: Transition.native)}),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String endText;
  final Color endTextColor;
  final Function() onTap;

  CustomListTile(
      this.icon, this.text, this.endText, this.endTextColor, this.onTap);
  @override
  Widget build(BuildContext context) {
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 14.0, 0),
      child: Container(
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(color: grey_3))),
        child: InkWell(
            splashColor: grey_1,
            onTap: onTap,
            child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: Get.mediaQuery.size.width * 0.064),
                          Icon(icon),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          ),
                          Text(
                            text,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      endText,
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: endTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      LineIcons.angleRight,
                      // Icons.arrow_forward_ios,
                      size: 20,
                      color: endTextColor,
                    ),
                  ],
                ))),
      ),
    );
  }
}
