import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';

class CareRewardCompletedPage extends StatelessWidget {
  const CareRewardCompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: white,
          body: buildBody(),
        ));
  }

  Widget buildBody() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: Get.mediaQuery.size.height * 0.2),
          Icon(LineIcons.gifts, color: primary, size: 110),
          SizedBox(height: 26),
          Text(
            '보상 상품은 곧\n보내드릴께요',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: spacing_m),
          Text(
            '플리닉과 함께 피부 습관 만들기\n계속 도전해주세요 :)',
            style: TextStyle(
              fontFamily: 'NotoSans',
              color: black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(child: SizedBox(height: 1)),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                side: MaterialStateProperty.all(BorderSide(color: primary)),
                minimumSize: MaterialStateProperty.all(
                  Size(Get.mediaQuery.size.width, 60),
                ),
                backgroundColor: MaterialStateProperty.all(primary)),
            onPressed: () async {
              await Get.offAllNamed('/tabs');
            },
            child: AutoSizeText(
              '감사합니다',
              minFontSize: 16,
              style: TextStyle(
                fontFamily: 'NotoSans',
                color: white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _onwillPop() async {
    return false;
  }
}
