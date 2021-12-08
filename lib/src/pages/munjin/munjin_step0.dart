import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/munjin/munjin_question1.dart';

class MunJinStep0Page extends StatelessWidget {
  const MunJinStep0Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(LineIcons.times, color: grey_1),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      backgroundColor: white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 110.6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text('피부타입 문진에 참여 후',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 20,
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          ),
          SizedBox(height: spacing_xxs),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            child: Text(
              '모든 서비스 이용이 가능합니다.',
              style: TextStyle(
                fontFamily: 'NotoSansKR',
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Divider(height: 1, thickness: 1, color: black),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xxl),
            child: Row(
              children: [
                Icon(LineIcons.clipboardWithCheck, color: primary, size: 60),
                SizedBox(width: 25),
                Text('몇 가지 설문을 통하여\n필요한 피부관리 성분을 알아보세요.\n설문은 약 5분정도 소요됩니다.',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: black,
                      fontSize: 14,
                      height: 1.64,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
          Expanded(child: SizedBox(height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  // shape: MaterialStateProperty.all(
                  //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  backgroundColor: MaterialStateProperty.all(primary),
                  minimumSize: MaterialStateProperty.all(
                      Size(Get.mediaQuery.size.width, 48))),
              onPressed: () {
                Get.to(() => MunjinQuestion1Page(),
                    transition: Transition.native);
              },
              child: Text('피부 타입 문진 참여하기',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ),
          SizedBox(height: spacing_xs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    // shape: MaterialStateProperty.all(
                    //     RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey.shade200;
                      }
                      return Colors.white;
                    }),
                    minimumSize: MaterialStateProperty.all(
                        Size(Get.mediaQuery.size.width, 48))),
                onPressed: () {
                  Get.back();
                },
                child: Text('다음에 할께요',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR',
                      color: grey_2,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
