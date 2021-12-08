import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/home/home_skin_type.dart';

class MainGuidePage extends StatelessWidget {
  const MainGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: spacing_m),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spacing_xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => HomeSkinType(currentTab: 0),
                        transition: Transition.native);
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
                    Get.to(() => HomeSkinType(currentTab: 1),
                        transition: Transition.native);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/home/shapes-solid.svg'),
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
                    Get.to(() => HomeSkinType(currentTab: 2),
                        transition: Transition.native);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/home/clock.svg'),
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
                InkWell(
                  onTap: () {
                    Get.to(() => HomeSkinType(currentTab: 3),
                        transition: Transition.native);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                          'assets/images/home/puzzle-piece-solid.svg'),
                      Text(
                        '기타',
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
          SizedBox(height: spacing_m),
          Divider(thickness: 8, color: grey_3),
        ],
      ),
    );
  }
}
