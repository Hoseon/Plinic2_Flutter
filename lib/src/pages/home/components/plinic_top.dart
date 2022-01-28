import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/pages/alarm/alarm.dart';
import 'package:plinic2/src/pages/my/my_test.dart';
import 'package:shimmer/shimmer.dart';

class PlinicTopPage extends StatelessWidget {
  const PlinicTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ProfileController.to.myProfile.value.name != null
        ? buildBody()
        : buildLoading());
  }

  Widget buildLoading() {
    return Container(
      width: Get.mediaQuery.size.width,
      height: 552,
      color: grey_3,
      child: Column(
        children: [
          SizedBox(height: 44),
          Padding(
            padding: const EdgeInsets.only(left: spacing_xl, right: spacing_m),
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
                  child: Icon(LineIcons.userCircleAlt, size: 28, color: black),
                ),
              ],
            ),
          ),
          SizedBox(height: spacing_xxl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(160, 24, grey_3),
          ),
          SizedBox(height: 21),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 180,
              color: white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: spacing_xl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildshimmer(80, 28, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_m),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildshimmer(270, 28, grey_3),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildshimmer(270, 36, grey_3),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_l),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
              width: Get.mediaQuery.size.width,
              height: 102,
              color: white,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: grey_2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 5),
                        _buildshimmer(84, 15, grey_3),
                        SizedBox(width: 11),
                        Expanded(child: _buildshimmer(36, 15, grey_3)),
                        _buildshimmer(46, 15, grey_3),
                        Icon(
                          LineIcons.angleRight,
                          color: grey_2,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      _buildshimmer(280, 15, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_m),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      _buildshimmer(319, 12, grey_3),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    _buildshimmer(36, 36, grey_3),
                    _buildshimmer(45, 20, grey_1),
                  ],
                ),
                Column(
                  children: [
                    _buildshimmer(36, 36, grey_3),
                    _buildshimmer(45, 20, grey_1),
                  ],
                ),
                Column(
                  children: [
                    _buildshimmer(36, 36, grey_3),
                    _buildshimmer(45, 20, grey_1),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      width: Get.mediaQuery.size.width,
      height: 552,
      color: grey_3,
      child: Column(
        children: [
          SizedBox(height: 44),
          Padding(
            padding: const EdgeInsets.only(left: spacing_xl, right: spacing_m),
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
                  child: Icon(LineIcons.userCircleAlt, size: 28, color: black),
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
                    padding: const EdgeInsets.symmetric(horizontal: spacing_xs),
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
                        Icon(LineIcons.angleRight, color: black, size: 11),
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
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: primary,
                    backgroundColor: grey_3,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    // Get.to(() => HomeSkinType(currentTab: 0),
                    //     transition: Transition.native);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/home/tint-solid.svg'),
                      Text(
                        '피부특성',
                        style: TextStyle(
                          color: Color(0xff1d1d1d),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.to(() => HomeSkinType(currentTab: 1),
                    //     transition: Transition.native);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                          'assets/images/home/sliders-h-solid.svg'),
                      Text(
                        '전성분',
                        style: TextStyle(
                          color: Color(0xff1d1d1d),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.to(() => HomeSkinType(currentTab: 2),
                    //     transition: Transition.native);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                          'assets/images/home/puzzle-piece-solid.svg'),
                      Text(
                        '생활습관',
                        style: TextStyle(
                          color: Color(0xff1d1d1d),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
    );
  }

  Shimmer _buildshimmer(double width, double height, color) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
      baseColor: color,
      highlightColor: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width,
            height: height,
            color: grey_3,
          ),
        ],
      ),
    );
  }
}
