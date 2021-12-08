import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/tabs/tabs.dart';

class MunjinEndPage extends StatefulWidget {
  const MunjinEndPage({Key? key}) : super(key: key);

  @override
  _MunjinEndPageState createState() => _MunjinEndPageState();
}

class _MunjinEndPageState extends State<MunjinEndPage> {
  bool completeLoad = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        completeLoad = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        elevation: 0.3,
        title: Text('피부타입 문진 분석',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: Color(0xff000000),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )),
      ),
      body: completeLoad ? buildBody() : buildLoading(),
    );
  }

  Widget buildLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: CircularPercentIndicator(
            restartAnimation: false,
            radius: 64,
            animation: true,
            animationDuration: 3000,
            lineWidth: 7,
            curve: Curves.linear,
            // startAngle: 50,
            // animateFromLastPercent: true,
            // fillColor: primary,
            progressColor: primary,
            // center: Text('aa'),
            percent: 1,
          ),
        ),
        SizedBox(height: 68),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '고객님의  문진 내용을\n',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            TextSpan(
                text: '분석하는 중입니다.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ])),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(
            '잠시만 기다려 주세요.',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: grey_1,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: CircularPercentIndicator(
            restartAnimation: false,
            radius: 64,
            // animation: true,
            // animationDuration: 3000,
            lineWidth: 7,
            curve: Curves.linear,
            // startAngle: 50,
            // animateFromLastPercent: true,
            // fillColor: primary,
            progressColor: primary,
            // center: Text('aa'),
            percent: 1,
          ),
        ),
        SizedBox(height: 68),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '고객님의  문진 내용이\n',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            TextSpan(
                text: '분석완료 되었습니다.',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ])),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Divider(height: 0, thickness: 1, color: black),
        ),
        SizedBox(height: spacing_xl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: Text(
            '결과를 확인하시려면 아래 버튼을 눌러주세요.',
            style: TextStyle(
              fontFamily: 'NotoSansKR',
              color: grey_1,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        SizedBox(height: 72),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
          child: ElevatedButton(
            onPressed: () {
              Get.offAll(() => Tabs());
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primary),
                minimumSize: MaterialStateProperty.all(
                    Size(Get.mediaQuery.size.width, 42))),
            child: Text('분석결과 확인하러 가기',
                style: TextStyle(
                  fontFamily: 'NotoSansKR',
                  color: white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          ),
        )
      ],
    );
  }
}
