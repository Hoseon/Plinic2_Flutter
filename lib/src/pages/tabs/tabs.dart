import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/controller/profile_controller.dart';
import 'package:plinic2/src/controller/tabs_controller.dart';
import 'package:plinic2/src/pages/care/care_main.dart';
import 'package:plinic2/src/pages/challenge/challenge.dart';
import 'package:plinic2/src/pages/home/home_main.dart';
import 'package:plinic2/src/pages/my/my.dart';
import 'package:plinic2/src/pages/profile.dart';
import 'package:plinic2/src/pages/shop/shop.dart';

class Tabs extends GetView<TabsController> {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController(), permanent: true);
    return Scaffold(
      // appBar: AppBar(),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text('앱을 종료 하시겠습니까?\n한번더 누르면 종료 됩니다.'),
        ),
        child: Obx(() {
          switch (RouteName.values[controller.currentIndex.value]) {
            // case RouteName.Home:
            //   return HomeMainPage();
            case RouteName.Care:
              return CareMainPage();
            // case RouteName.Community:
            //   return CommunityPage();
            // case RouteName.Shop:
            //   return ShopPage();
            // case RouteName.Temp:
            //   return Profile();
            case RouteName.My:
              return MyPage();
            // case RouteName.My:
            //   return MyPage();
          }
        }),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          showSelectedLabels: true,
          selectedItemColor: Color(0xff6200EE),
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            print(index);
            controller.changePageIndex(index);
          },
          items: [
            // buildBottomNavigationBarItem(
            //     'assets/images/tabs/bottom-home-inactive.svg',
            //     'assets/images/tabs/bottom-home.svg',
            //     '홈'),
            buildBottomNavigationBarItem(
                'assets/images/tabs/bottom-care-inactive.svg',
                'assets/images/tabs/bottom-care.svg',
                '케어'),
            // buildBottomNavigationBarItem(
            //     'assets/images/tabs/bottom-community-inactive.svg',
            //     'assets/images/tabs/bottom-community.svg',
            //     '커뮤니티'),
            // buildBottomNavigationBarItem(
            //     'assets/images/tabs/bottom-shopping-inactive.svg',
            //     'assets/images/tabs/bottom-shopping.svg',
            //     '쇼핑'),
            buildBottomNavigationBarItem(
                'assets/images/tabs/bottom-user-inactive.svg',
                'assets/images/tabs/bottom-user.svg',
                '마이'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String imgPath, String activeImgPath, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SvgPicture.asset(imgPath),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SvgPicture.asset(activeImgPath),
      ),
      label: label,
    );
  }
}
