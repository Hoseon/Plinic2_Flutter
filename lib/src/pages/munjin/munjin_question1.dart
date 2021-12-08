import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/munjin/munjin_question2.dart';

class MunjinQuestion1Page extends StatefulWidget {
  const MunjinQuestion1Page({Key? key}) : super(key: key);

  @override
  _MunjinQuestion1PageState createState() => _MunjinQuestion1PageState();
}

class _MunjinQuestion1PageState extends State<MunjinQuestion1Page> {
  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(LineIcons.times, color: grey_1),
          )
        ],
        leading: SizedBox(),
        title: Text('피부타입 문진',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: Color(0xff000000),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spacing_xl),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('지성 (Oily) vs 건성 (Dry) ',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_xl),
            LinearProgressIndicator(
              value: 0.1,
              color: primary,
              backgroundColor: grey_2,
              minHeight: 2,
            ),
            SizedBox(height: spacing_xxl2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('질문 1',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: grey_1,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_xxs),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('평소 당신의 이마와 양 볼의 느낌이나 외양은 \n어떤가요?',
                  style: TextStyle(
                    fontFamily: 'NotoSansKR',
                    color: black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            SizedBox(height: spacing_l),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Divider(height: 0, color: grey_2),
            ),
            SizedBox(height: spacing_xl),
            buildQuestion(0, '매우 거칠거나, 각질이 떨어지거나 창백하다'),
            buildQuestion(1, '탱탱하다.'),
            buildQuestion(2, '밝은 빛을 반사하며 윤기난다'),
            buildQuestion(3, '빛의 반사가 없으며 피부에 촉촉함이 느껴진다.'),
            SizedBox(height: spacing_xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          side: MaterialStateProperty.all(
                              BorderSide(color: grey_2)),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.grey.shade200;
                            }
                            return white;
                          }),
                          minimumSize: MaterialStateProperty.all(
                              Size(Get.mediaQuery.size.width, 42))),
                      onPressed: () {
                        Get.back();
                        ;
                      },
                      child: Text(
                        '이전',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    flex: 6,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(primary),
                          minimumSize: MaterialStateProperty.all(
                              Size(Get.mediaQuery.size.width, 42))),
                      onPressed: () {
                        Get.to(() => MunjinQuestion2Page(),
                            transition: Transition.native);
                      },
                      child: Text(
                        '다음',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildQuestion(int index, String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: InkWell(
            onTap: () {
              setState(() {
                selectIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.centerLeft,
              width: Get.mediaQuery.size.width,
              height: 44,
              decoration: BoxDecoration(
                border:
                    Border.all(color: index == selectIndex ? primary : grey_2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LineIcons.checkCircle,
                      color: index == selectIndex ? primary : grey_2, size: 25),
                  SizedBox(width: 13.9),
                  Text(title,
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: grey_1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: spacing_m),
      ],
    );
  }
}
