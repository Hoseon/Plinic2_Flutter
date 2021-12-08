import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/my/notice/notice.dart';
import 'package:plinic2/src/pages/my/qna/qna.dart';
import 'package:plinic2/src/pages/my/setting/faq/faq.dart';

class MainBottomPage extends StatelessWidget {
  const MainBottomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing_xxl2),
        InkWell(
          onTap: () {
            Get.to(() => FaqPage(), transition: Transition.native);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Icon(LineIcons.questionCircle),
                SizedBox(width: 11),
                Expanded(
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontSize: 14,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Icon(LineIcons.angleRight, size: 20)
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_s),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(height: 0),
        ),
        SizedBox(height: spacing_s),
        InkWell(
          onTap: () {
            Get.to(() => NoticePage(), transition: Transition.native);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Icon(LineIcons.bullhorn),
                SizedBox(width: 11),
                Expanded(
                  child: Text(
                    '공지사항',
                    style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontSize: 14,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Icon(LineIcons.angleRight, size: 20)
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xxl2),
      ],
    );
  }
}
