import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/munjin/munjin_question8.dart';

class MunjinQuestion7Page extends StatefulWidget {
  const MunjinQuestion7Page({Key? key}) : super(key: key);

  @override
  _MunjinQuestion7PageState createState() => _MunjinQuestion7PageState();
}

class _MunjinQuestion7PageState extends State<MunjinQuestion7Page> {
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
              child: Text('민강성 (Sensitive) vs 저항성(Resistance)',
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
              value: 0.8,
              color: primary,
              backgroundColor: grey_2,
              minHeight: 2,
            ),
            SizedBox(height: spacing_xxl2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
              alignment: Alignment.centerLeft,
              child: Text('질문 7',
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
              child: Text('운동, 스트레스 또는 격한 감정(분노 등)에 의해 얼굴과 목이 붉어지나요?',
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
            buildQuestion(0, '전혀 안 나타난다.'),
            buildQuestion(1, '거의 안 나타난다.'),
            buildQuestion(2, '자주 나타난다.'),
            buildQuestion(3, '항상 나타난다.'),
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
                        Get.to(() => MunjinQuestion8Page(),
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
