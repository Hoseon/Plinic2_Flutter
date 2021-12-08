import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';
import 'package:plinic2/src/pages/friends/invite_history.dart';

class InviteFriend extends StatelessWidget {
  const InviteFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(title: '친구초대'),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Get.back();
            },
            color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/app-icons-256-x-256.png',
                      width: Get.mediaQuery.size.width * 0.3,
                    ),
                  ],
                ),
                SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '꾸준한 피부관리를 도와주는\n나의 스킨케어 코치!',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: spacing_xl),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Plinic이 필요한 친구들에게 \n초대메시지를 보내고\n포인트를 받아 보세요!',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: Color(0xff000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 66),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '초대코드 : DITKEG39',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary_dark,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(width: spacing_s),
                    Icon(Icons.content_copy),
                  ],
                ),
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.mediaQuery.size.width, height: 42),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide.none),
                        ),
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {},
                      child: Text(
                        '친구초대하기',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: Color(0xffffffff),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            Get.to(() => InviteHistoryPage());
                          },
                          child: Row(
                            children: [
                              Text(
                                '초대회원 123명',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR',
                                  color: grey_1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(width: 5.6),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: grey_1,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spacing_xl)
              ],
            )),
      ),
    );
  }
}
