import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/ble_connect/ble_ready.dart';
import 'package:plinic2/src/pages/home/components/main_banner1.dart';
import 'package:plinic2/src/pages/home/components/main_banner2.dart';
import 'package:plinic2/src/pages/home/components/main_banner3.dart';
import 'package:plinic2/src/pages/home/components/main_bottom.dart';
import 'package:plinic2/src/pages/home/components/main_guide.dart';
import 'package:plinic2/src/pages/home/components/main_magazine.dart';
import 'package:plinic2/src/pages/home/components/main_type.dart';
import 'package:plinic2/src/pages/home/components/month_solution.dart';
import 'package:plinic2/src/pages/home/components/plinic_top.dart';
import 'package:plinic2/src/pages/plinic_fab.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // floatingActionButton: FlowMenu(),
      floatingActionButton: PlinicFaB(),
      // body: homeMain_Loading(),
      body: build_main(context),
    );
  }

  Widget build_main(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PlinicTopPage(),
          // MainGuidePage(), 2021-12-20 홈 디자인 변경
          MonthSolutionPage(),
          MainBanner1Page(),
          MainMagazine(),
          MainBanner2Page(),
          MainTypePage(),
          MainBanner3Page(),
          MainBottomPage(),
        ],
      ),
    );
  }

  Widget homeMain_Loading() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: textfields,
            width: Get.mediaQuery.size.width,
            height: 364,
            child: Column(
              children: [
                SizedBox(height: spacing_xl),
                SizedBox(height: spacing_xl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/images/home/plinic.svg',
                      ),
                      Expanded(child: SizedBox(width: 1)),
                      _buildshimmer(32, 32, grey_3),
                      SizedBox(width: spacing_s),
                      _buildshimmer(32, 32, grey_3),
                    ],
                  ),
                ),
                SizedBox(height: 54.4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: _buildshimmer(160, 32, grey_2),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildshimmer(152, 40, grey_3),
                      _buildshimmer(152, 40, grey_3),
                    ],
                  ),
                ),
                SizedBox(height: spacing_l),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Row(
                    children: [
                      _buildCalendarshimmerCircle(8, 8, grey_2),
                      SizedBox(width: 5),
                      Expanded(child: _buildshimmer(84, 20, grey_2)),
                      _buildshimmer(46, 20, grey_2),
                      Icon(LineIcons.angleRight, color: grey_2, size: 18)
                    ],
                  ),
                ),
                SizedBox(height: spacing_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: Container(
                    width: Get.mediaQuery.size.width,
                    height: 16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), color: grey_2),
                  ),
                ),
                SizedBox(height: spacing_m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
                  child: _buildshimmer(280, 20, grey_3),
                ),
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _buildshimmer(36, 36, grey_2),
                    _buildshimmer(45, 20, grey_3)
                  ],
                ),
                Column(
                  children: [
                    _buildshimmer(36, 36, grey_2),
                    _buildshimmer(45, 20, grey_3)
                  ],
                ),
                Column(
                  children: [
                    _buildshimmer(36, 36, grey_2),
                    _buildshimmer(45, 20, grey_3)
                  ],
                ),
                Column(
                  children: [
                    _buildshimmer(36, 36, grey_2),
                    _buildshimmer(45, 20, grey_3)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: spacing_m),
          _buildshimmer(Get.mediaQuery.size.width, 8, grey_3),
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(288, 28, grey_3),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(88, 78, grey_3),
                SizedBox(width: spacing_s),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(208, 24, grey_3),
                    _buildshimmer(160, 24, grey_3),
                    _buildshimmer(104, 24, grey_3),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: spacing_xs, vertical: spacing_xs),
              width: Get.mediaQuery.size.width,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: grey_2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: _buildshimmer(288, 24, grey_2),
            ),
          ),
          SizedBox(height: spacing_l),
          _buildshimmer(Get.mediaQuery.size.width, 8, grey_3),
          _buildshimmer(Get.mediaQuery.size.width, 134, Color(0xffc4c4c4)),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(288, 28, grey_2),
          ),
          SizedBox(height: spacing_xxs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(288, 20, grey_3),
          ),
          SizedBox(height: spacing_xl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(100, 100, grey_2),
                SizedBox(width: spacing_s),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(
                        Get.mediaQuery.size.width * 0.573, 20, grey_3),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(
                        Get.mediaQuery.size.width * 0.573, 48, grey_3),
                    SizedBox(height: spacing_xxs),
                    Row(
                      children: [
                        Icon(LineIcons.heart, color: grey_3, size: 20),
                        SizedBox(width: spacing_xxs),
                        _buildshimmer(114, 20, grey_3),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: spacing_xxl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(100, 100, grey_2),
                SizedBox(width: spacing_s),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(
                        Get.mediaQuery.size.width * 0.573, 20, grey_3),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(
                        Get.mediaQuery.size.width * 0.573, 48, grey_3),
                    SizedBox(height: spacing_xxs),
                    Row(
                      children: [
                        Icon(LineIcons.heart, color: grey_3, size: 20),
                        SizedBox(width: spacing_xxs),
                        _buildshimmer(114, 20, grey_3),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: spacing_xxl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                _buildshimmer(100, 100, grey_2),
                SizedBox(width: spacing_s),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildshimmer(
                        Get.mediaQuery.size.width * 0.573, 20, grey_3),
                    SizedBox(height: spacing_xxs),
                    _buildshimmer(
                        Get.mediaQuery.size.width * 0.573, 48, grey_3),
                    SizedBox(height: spacing_xxs),
                    Row(
                      children: [
                        Icon(LineIcons.heart, color: grey_3, size: 20),
                        SizedBox(width: spacing_xxs),
                        _buildshimmer(114, 20, grey_3),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 48),
          _buildshimmer(Get.mediaQuery.size.width, 134, Color(0xffc4c4c4)),
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(288, 28, grey_2),
          ),
          SizedBox(height: spacing_xxs),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: _buildshimmer(288, 20, grey_3),
          ),
          SizedBox(height: spacing_xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildshimmer(156, 140, grey_2),
                  SizedBox(height: spacing_xs),
                  Row(
                    children: [
                      Icon(LineIcons.heart, size: 20, color: grey_2),
                      SizedBox(width: spacing_xs),
                      Icon(LineIcons.shoppingBag, size: 20, color: grey_2),
                    ],
                  ),
                  SizedBox(height: 9.8),
                  _buildshimmer(156, 36, grey_3),
                  SizedBox(height: spacing_xxs),
                  Row(
                    children: [
                      _buildshimmer(20, 16, grey_3),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(120, 16, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xxs),
                  _buildshimmer(152, 20, grey_3),
                  SizedBox(height: spacing_xxs),
                  _buildshimmer(156, 20, grey_3),
                ],
              ),
              SizedBox(width: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildshimmer(156, 140, grey_2),
                  SizedBox(height: spacing_xs),
                  Row(
                    children: [
                      Icon(LineIcons.heart, size: 20, color: grey_2),
                      SizedBox(width: spacing_xs),
                      Icon(LineIcons.shoppingBag, size: 20, color: grey_2),
                    ],
                  ),
                  SizedBox(height: 9.8),
                  _buildshimmer(156, 36, grey_3),
                  SizedBox(height: spacing_xxs),
                  Row(
                    children: [
                      _buildshimmer(20, 16, grey_3),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(120, 16, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xxs),
                  _buildshimmer(152, 20, grey_3),
                  SizedBox(height: spacing_xxs),
                  _buildshimmer(156, 20, grey_3),
                ],
              ),
            ],
          ),
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Divider(),
          ),
          SizedBox(height: spacing_m),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildshimmer(156, 140, grey_2),
                  SizedBox(height: spacing_xs),
                  Row(
                    children: [
                      Icon(LineIcons.heart, size: 20, color: grey_2),
                      SizedBox(width: spacing_xs),
                      Icon(LineIcons.shoppingBag, size: 20, color: grey_2),
                    ],
                  ),
                  SizedBox(height: 9.8),
                  _buildshimmer(156, 36, grey_3),
                  SizedBox(height: spacing_xxs),
                  Row(
                    children: [
                      _buildshimmer(20, 16, grey_3),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(120, 16, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xxs),
                  _buildshimmer(152, 20, grey_3),
                  SizedBox(height: spacing_xxs),
                  _buildshimmer(156, 20, grey_3),
                ],
              ),
              SizedBox(width: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildshimmer(156, 140, grey_2),
                  SizedBox(height: spacing_xs),
                  Row(
                    children: [
                      Icon(LineIcons.heart, size: 20, color: grey_2),
                      SizedBox(width: spacing_xs),
                      Icon(LineIcons.shoppingBag, size: 20, color: grey_2),
                    ],
                  ),
                  SizedBox(height: 9.8),
                  _buildshimmer(156, 36, grey_3),
                  SizedBox(height: spacing_xxs),
                  Row(
                    children: [
                      _buildshimmer(20, 16, grey_3),
                      SizedBox(width: spacing_xxs),
                      _buildshimmer(120, 16, grey_3),
                    ],
                  ),
                  SizedBox(height: spacing_xxs),
                  _buildshimmer(152, 20, grey_3),
                  SizedBox(height: spacing_xxs),
                  _buildshimmer(156, 20, grey_3),
                ],
              ),
            ],
          ),
          SizedBox(height: 48),
          _buildshimmer(Get.mediaQuery.size.width, 134, Color(0xffc4c4c4)),
          SizedBox(height: spacing_xxl2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Icon(LineIcons.questionCircle, color: grey_3, size: 25),
                SizedBox(width: 11),
                _buildshimmer(156, 24, grey_3)
              ],
            ),
          ),
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Divider(),
          ),
          SizedBox(height: spacing_s),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              children: [
                Icon(LineIcons.questionCircle, color: grey_3, size: 25),
                SizedBox(width: 11),
                _buildshimmer(156, 24, grey_3)
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Shimmer _buildshimmer(double width, double height, color) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
      baseColor: color,
      highlightColor: Colors.grey.shade200,
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

  Shimmer _buildCalendarshimmerCircle(double width, double height, color) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
      baseColor: color,
      highlightColor: Colors.grey.shade300,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
