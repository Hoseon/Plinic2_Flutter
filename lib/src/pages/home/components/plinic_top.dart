import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/alarm/alarm.dart';
import 'package:plinic2/src/pages/munjin/munjin_step0.dart';
import 'package:plinic2/src/pages/my/my_test.dart';

class PlinicTopPage extends StatelessWidget {
  const PlinicTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ProfileController.to.myProfile.value.name != null
        ? Container(
            width: Get.mediaQuery.size.width,
            height: 552,
            color: grey_3,
            child: Column(
              children: [
                SizedBox(height: 44),
                Padding(
                  padding:
                      const EdgeInsets.only(left: spacing_xl, right: spacing_m),
                  child: Row(
                    children: [
                      Text('홈',
                          style: TextStyle(
                            // fontFamily: 'NotoSansKR',
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      Expanded(child: SizedBox(width: 1)),
                      InkWell(
                          onTap: () {
                            Get.to(AlarmPage(), transition: Transition.native);
                          },
                          child: Icon(LineIcons.bell, size: 28, color: black)),
                      SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          Get.to(MyTestPage(), transition: Transition.native);
                        },
                        child: Icon(LineIcons.userCircleAlt,
                            size: 28, color: black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing_xxl),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        '${ProfileController.to.myProfile.value.name.toString()}님의',
                        style: TextStyle(
                          // fontFamily: 'NotoSansKR',
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(width: spacing_xxs),
                      Text(
                        '피부타입',
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 14,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing_l),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Container(
                    width: Get.mediaQuery.size.width,
                    height: 180,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x07000000),
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 0),
                        BoxShadow(
                            color: Color(0x07000000),
                            offset: Offset(-4, -4),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: spacing_s),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              Size(Get.mediaQuery.size.width * 0.173, 28),
                            ),
                            backgroundColor: MaterialStateProperty.all(primary),
                          ),
                          onPressed: () {},
                          child: Text(
                            'ORNW',
                            style: TextStyle(
                              color: white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        Text(
                          '무관심에 말라버린 다육식물 유형',
                          style: TextStyle(
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        Text(
                          '기름지고 민감하며 색소 침착이 잘되는\n주름진 피부입니다.',
                          style: TextStyle(
                              color: grey_1,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              height: 1.64),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: spacing_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Container(
                    width: Get.mediaQuery.size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x07000000),
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 0),
                        BoxShadow(
                            color: Color(0x07000000),
                            offset: Offset(-4, -4),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: spacing_m,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing_xs),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: spacing_xxs),
                              Text(
                                '현재 문진 참여율',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              SizedBox(width: spacing_xs),
                              Expanded(
                                child: Text(
                                  '100%',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              Text(
                                '새로 문진하기',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Icon(LineIcons.angleRight,
                                  color: black, size: 11),
                            ],
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: spacing_l),
                          child: Text(
                            '드디어 문진을 완성하셨어요! ',
                            style: TextStyle(
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        SizedBox(height: spacing_s),
                        LinearPercentIndicator(
                          padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                          width: Get.mediaQuery.size.width * 0.87,
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 16.0,
                          leading: Text(''),
                          trailing: Text(''),
                          percent: 1.0,
                          animateFromLastPercent: true,
                          // center: Text(
                          //   '20.0%',
                          //   style: TextStyle(
                          //     fontFamily: 'NotoSansKR',
                          //     color: grey_1,
                          //     fontSize: 12,
                          //     fontWeight: FontWeight.w400,
                          //     fontStyle: FontStyle.normal,
                          //   ),
                          // ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: primary,
                          backgroundColor: grey_3,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '문진을 완성하면 더 정확한 피부타입과 함께 ⓒ 500 적립!',
                    style: TextStyle(
                      color: grey_3,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: Get.mediaQuery.size.width,
            height: 325,
            color: primary,
            child: Column(
              children: [
                SizedBox(height: 44),
                Padding(
                  padding:
                      const EdgeInsets.only(left: spacing_xl, right: spacing_m),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/home/plinic.svg',
                      ),
                      Expanded(child: SizedBox(width: 1)),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Get.to(AlarmPage(), transition: Transition.native);
                        },
                        icon: Icon(LineIcons.bell, size: 32, color: white),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Get.to(MyTestPage(), transition: Transition.native);
                        },
                        icon: Icon(LineIcons.userCircleAlt,
                            size: 32, color: white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing_xxl2),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                  alignment: Alignment.centerLeft,
                  child: Text(' 님의 피부타입은 ',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                SizedBox(height: spacing_xs),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      Text('OSPT ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: white,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 2.4,
                          )),
                      SizedBox(width: spacing_s),
                      Text(
                        '기름지고 민감하며 색소 침착이\n잘되는 주름진 피부입니다.',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          height: 19.600000381469727 / 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10))),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '현재 문진 참여율',
                          style: TextStyle(
                            color: grey_3,
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Text(
                        '바로가기',
                        style: TextStyle(
                          color: grey_3,
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          // height: 19.600000381469727 / 12,
                        ),
                      ),
                      Icon(
                        LineIcons.angleRight,
                        color: white,
                        size: 13,
                      )
                    ],
                  ),
                ),
                SizedBox(height: spacing_m),
                LinearPercentIndicator(
                  padding: EdgeInsets.symmetric(horizontal: spacing_xl),
                  width: Get.mediaQuery.size.width,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 16.0,
                  leading: Text(''),
                  trailing: Text(''),
                  // percent: 0.2,
                  // center: Text(
                  //   '20.0%',
                  //   style: TextStyle(
                  //     fontFamily: 'NotoSansKR',
                  //     color: grey_1,
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w400,
                  //     fontStyle: FontStyle.normal,
                  //   ),
                  // ),
                  linearStrokeCap: LinearStrokeCap.butt,
                  progressColor: primary_dark,
                  backgroundColor: grey_3,
                ),
                SizedBox(height: spacing_m),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '문진을 완성하면 더 정확한 피부타입과 함께 ⓒ 500 적립!',
                    style: TextStyle(
                      color: grey_3,
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ));
  }
}
