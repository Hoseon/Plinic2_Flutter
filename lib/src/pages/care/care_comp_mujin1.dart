import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/component/plinic_dialog_two_button.dart';
import 'package:plinic2/src/pages/care/care_comp_mujin2.dart';
import 'package:plinic2/src/pages/tabs/tabs.dart';

class CareCompMujin1Page extends StatefulWidget {
  const CareCompMujin1Page({Key? key}) : super(key: key);

  @override
  _CareCompMujin1PageState createState() => _CareCompMujin1PageState();
}

class _CareCompMujin1PageState extends State<CareCompMujin1Page> {
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
              exitDialog(context);
            },
            icon: Icon(LineIcons.times, color: grey_1),
          )
        ],
        leading: SizedBox(),
        title: Text('서비스 설문조사',
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
            // SizedBox(height: spacing_xl),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            //   alignment: Alignment.centerLeft,
            //   child: Text('질문1',
            //       style: TextStyle(
            //         fontFamily: 'NotoSansKR',
            //         color: grey_1,
            //         fontSize: 14,
            //         fontWeight: FontWeight.w700,
            //         fontStyle: FontStyle.normal,
            //       )),
            // ),
            // SizedBox(height: spacing_xl),
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
              child: Text('플리닉 서비스를 자주 이용하시나요?',
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
            buildQuestion(0, '매일 사용한다,(주 10회 이상)'),
            buildQuestion(1, '자주 사용한다.(주 8 ~ 10회)'),
            buildQuestion(2, '가끔 사용한다.(주 4 ~ 7 회)'),
            buildQuestion(3, '잘 사용하지 않는다.(주 3회 이하)'),
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
                        Get.to(() => CareCompMujin2Page(),
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

  void exitDialog(context) async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      builder: (BuildContext context) {
        return PlinicDialogTwoButton(
          button1Text: '아니요',
          button2Text: '다시할께요',
          title: '알림',
          content: '설문조사를 종료하시면\n보상을 받으실 수 없습니다.\n\n설문조사를 종료 하시겠습니까?',
          button1Click: () {
            Get.back();
          },
          button2Click: () {
            Get.back();
            Get.offAll(() => Tabs(), transition: Transition.native);
          },
        );
      },
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
