import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/appbar_title.dart';

class InviteHistoryPage extends StatelessWidget {
  const InviteHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarTitle(title: '초대이력'),
        centerTitle: true,
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              LineIcons.arrowLeft,
            ),
            onPressed: () {
              Get.back();
            },
            color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        children: [
          SizedBox(height: 46),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '123',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: primary_dark,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextSpan(
                      text: '명',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: primary_dark,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                ]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '초대회원',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              )
            ],
          ),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '홍길동(010-****-1234)',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  '2021.07.24',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: grey_2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: spacing_s),
          Divider(),
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '홍길동(010-****-1234)',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  '2021.07.24',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: grey_2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: spacing_s),
          Divider(),
          SizedBox(height: spacing_s),
        ],
      )),
    );
  }
}
