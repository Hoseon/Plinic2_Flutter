import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/tabs_controller.dart';

class MainMagazine extends StatelessWidget {
  const MainMagazine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 48),
        InkWell(
          onTap: () {
            TabsController.to.changePageIndex(2);
            // print('a');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            alignment: Alignment.centerLeft,
            height: 23,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '뷰티 매거진',
                  style: TextStyle(
                    color: Color(0xff1d1d1d),
                    fontSize: 16,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: spacing_xxs),
                Icon(LineIcons.angleRight, size: 16, color: black),
              ],
            ),
          ),
        ),
        SizedBox(height: spacing_xl),
        buildMagazine(
            '나만 몰랐던 피부관리법 5가지🖐🏻',
            '[진화하는 뷰티 테크] 오늘 피부가 저기압이군요. 촉촉·화사 파파파파 파파파파 파파파파 파파파파 파파파파 파파파파 파파파파 ',
            'assets/images/home/home-magazine-1.png',
            '152'),
        buildMagazine(
            '흐린 날에도 선크림🌞 꼭 발라야 ...',
            '선크림은 화장하기 전이나 외출 시 기초화장의 전 단계에 바르는 바르는 바르는 바르는 바르는 바르는 바르는 바르는 바르는 바르는 ',
            'assets/images/home/home-magazine-2.png',
            '98'),
        buildMagazine(
            '비누로 머리를 감아봤나요?',
            '어느 날 비누가 말했다. “망설이지 마세요.저는 지구의 미래이기 미래이기 미래이기 미래이기미래이기미래이기   ',
            'assets/images/home/home-magazine-3.png',
            '90'),
      ],
    );
  }

  Widget buildMagazine(
      String title, String desc, String imgPath, String count) {
    return InkWell(
      onTap: () {
        print('go to magazine');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(imgPath, width: 96, height: 100),
                SizedBox(width: spacing_s),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xff1d1d1d),
                        fontSize: 14,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        height: 1.64,
                      ),
                    ),
                    SizedBox(height: spacing_xxs),
                    Container(
                      width: Get.mediaQuery.size.width * 0.584,
                      child: Text(
                        desc,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.64),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: spacing_xxs),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(LineIcons.heart, color: black, size: 20),
                        SizedBox(width: 5.2),
                        Text(
                          '$count명이 좋아했어요',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: spacing_xl),
          ],
        ),
      ),
    );
  }
}
